public class PDFReportGenerator extends ReportGeneratorRefactoring {

    public void exportContent(DocumentFile docFile, Document document) {
        PDFExporter exporter = new PDFExporter();
        byte[] content = exporter.generatePDFFile(document);
        docFile.setContent(content);
    }

    public void configureMetadata(DocumentFile docFile) {
        docFile.setContentType("application/pdf");
        docFile.setPageSize("A4");
    }

}