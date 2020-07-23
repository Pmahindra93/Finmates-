function getPageName(url) {
    var index = url.lastIndexOf("/") + 1;
    var filenameWithExtension = url.substr(index);
    var filename = filenameWithExtension.split(".")[0]; // <-- added this line
    return filename;                                    // <-- added this line
}

$(function(){
   var currentPageName = getPageName(window.location.pathname);
   $('#' + currentPageName).addClass('sidemenu-active');
});

