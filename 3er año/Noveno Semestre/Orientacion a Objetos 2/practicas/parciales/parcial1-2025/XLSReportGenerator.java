public class XLSReportGenerator extends ReportGeneratorRefactoring {

    public void exportContent(DocumentFile docFile, Document document) {   
        ExcelWriter writer = new ExcelWriter();
        byte[] content = writer.generateExcelFile(document);
        docFile.setContent(content);
    }

    public void configureMetadata(DocumentFile docFile) {
        docFile.setContentType("application/vnd.ms-excel");
        docFile.setSheetName(document.getSubtitle());
    }

}