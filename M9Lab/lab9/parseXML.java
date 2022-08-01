package lab9;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;

public class parseXML {
    private DocumentBuilderFactory factory;
    private DocumentBuilder builder;

    public parseXML(){
        this.init();
    }

    public Document parse(String data) throws IOException, SAXException {
        StringBuilder sb = new StringBuilder();
        sb.append("<?xml version=\"1.0\"?> <class> </class>");
        ByteArrayInputStream input = new ByteArrayInputStream(
                sb.toString().getBytes(StandardCharsets.UTF_8));
        return this.builder.parse(input);
    }

    private void init(){
        this.factory = DocumentBuilderFactory.newInstance();
        try {
            this.builder = factory.newDocumentBuilder();
        } catch(javax.xml.parsers.ParserConfigurationException e){
         e.printStackTrace();
        }
    }

}
