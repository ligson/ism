package ueditor.utils
import com.baidu.ueditor.PathFormat
import org.apache.commons.fileupload.FileUploadBase
import org.apache.commons.fileupload.FileUploadException
import org.apache.commons.fileupload.servlet.ServletFileUpload
import org.springframework.web.multipart.MultipartFile

/**
 * Created by haihxiao on 14/9/14.
 */
class Uploader {
    // 输出文件地址
    String url = ""
    // 上传文件名
    String fileName = ""
    // 上传文件名
    String pathFormat = ""
    // 状态
    ErrorCode state
    // 文件类型
    String type = ""
    // 原始文件名
    String originalName = ""
    // 文件大小
    long size = 0

    // 保存路径
    String savePath = "images"
    // 文件允许格式
    String[] allowFiles = [] as String[]

    // 文件大小限制，单位KB
    int maxSize = 10000;

    public void upload(def request, String userSpace) throws Exception {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request)
        if (!isMultipart) {
            this.state = ErrorCode.NOFILE
            return
        }
        try {
            MultipartFile file = (MultipartFile)request.getFile('upfile')
            this.originalName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(System.getProperty("file.separator")) + 1)
            this.fileName = this.getName(this.originalName.toLowerCase(), userSpace)
            this.type = this.getFileExt(this.fileName)
            if (!this.checkFileType(type)) {
                this.state = ErrorCode.TYPE
                return
            }
            this.url = this.fileName;
            File ofile = new File(this.getPhysicalPath(request, this.url))
            ofile.getParentFile().mkdirs()
            file.transferTo(ofile)
            this.state =ErrorCode.SUCCESS
            this.size = file.size
        } catch (FileUploadBase.SizeLimitExceededException e) {
            this.state = ErrorCode.SIZE
        } catch (FileUploadBase.InvalidContentTypeException e) {
            this.state = ErrorCode.ENTYPE
        } catch (FileUploadException e) {
            this.state = ErrorCode.REQUEST
        } catch (Exception e) {
            this.state = ErrorCode.UNKNOWN
        }
    }

    /**
     * 文件类型判断
     *
     * @param fileName
     * @return
     */
    private boolean checkFileType(String type) {
        return this.allowFiles.length == 0 || this.allowFiles.contains(type.toLowerCase())
    }

    /**
     * 获取文件扩展名
     *
     * @return string
     */
    private String getFileExt(String fileName) {
        def i = fileName.lastIndexOf(".")
        return i != -1 ? fileName.substring(i) : ''
    }

    /**
     * 依据原始文件名生成新文件名
     * @return
     */
    private String getName(String fileName, String userSpace) {
        String name
        if(pathFormat) {
            name = PathFormat.parse(pathFormat, fileName)
        } else {
            name = Integer.toHexString(new Random().nextInt(256)) + '/' + System.currentTimeMillis() + "_" + fileName
        }
        return userSpace ? (userSpace + '/' + name) : name
    }

    /**
     * 根据传入的虚拟路径获取物理路径
     *
     * @param path
     * @return
     */
    public String getPhysicalPath(def request, String path) {
        File savePathFile = new File(savePath)
        if(savePathFile.isAbsolute()) {
            if(path.startsWith(File.separator)) {
                return savePath + path
            } else {
                return savePath + File.separator + path
            }
        } else {
            String servletPath = request.getServletPath();
            String realPath = request.getSession().getServletContext().getRealPath(servletPath)
            if(path.startsWith(File.separator)) {
                return new File(realPath).getParent() + File.separator + savePath + path
            } else {
                return new File(realPath).getParent() + File.separator + savePath +File.separator + path
            }
        }
    }
}
