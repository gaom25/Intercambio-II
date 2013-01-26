/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DownloadAction;
/**
 *
 * @author caponte
 */
public class Descarga extends DownloadAction {

    protected StreamInfo getStreamInfo(ActionMapping mapping, 
                                       ActionForm form,
                                       HttpServletRequest request, 
                                       HttpServletResponse response)
            throws Exception {
        
        // Download a "jpeg" file - gets the file name from the
        // Action Mapping's parameter
        String contentType         = "image/jpg";
        String path                = mapping.getParameter();
        ServletContext application = servlet.getServletContext();
        
        return new ResourceStreamInfo(contentType, application, path);   
    }
}