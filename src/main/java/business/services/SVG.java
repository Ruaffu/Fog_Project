package business.services;

public class SVG
{
    StringBuilder svg = new StringBuilder();

    private int x;
    private int y;
    private String viewBox;
    private int width;
    private int height;

    private final String headerTemplate = "<svg height=\"%d%%\" " +
            "width=\"%d%%\" " +
            "viewBox=\"%s\" " +
            "x=\"%d\" " +
            "y=\"%d\" " +
            " preserveAspectRatio=\"xMinYMin\">";

    private final String rectTemplate = "<rect x=\"%d\" y=\"%d\" height=\"%f\" width=\"%d\" style=\"stroke:#000000; fill: #ffffff\"/>";
    private final String lineTemplate = "<line x1=\"%d\" y1=\"%d\" x2=\"%d\" y2=\"%d\" stroke=\"black\" style=\"stroke-dasharray: 4 4\"/>";
    private final String arrowTemplate = "<line x1=\"%d\" y1=\"%d\" x2=\"%d\" y2=\"%d\" style=\"stroke:#000000; fill: #ffffff;marker-start: url(#beginArrow); marker-end: url(#endArrow)\"/>";
    private final String textTemplate = "<text style=\"text-anchor: middle\" transform=\"translate(%d, %d) rotate(%d)\">%d %s</text>";

    private final String markerTemplate = "<defs>\n" +
            "        <marker\n" +
            "                id=\"beginArrow\"\n" +
            "                markerWidth=\"12\"\n" +
            "                markerHeight=\"12\"\n" +
            "                refX=\"0\"\n" +
            "                refY=\"6\"\n" +
            "                orient=\"auto\">\n" +
            "            <path d=\"M0,6 L12,0 L12,12 L0,6\" style=\"fill: #000000;\"/>\n" +
            "        </marker>\n" +
            "        <marker\n" +
            "                id=\"endArrow\"\n" +
            "                markerWidth=\"12\"\n" +
            "                markerHeight=\"12\"\n" +
            "                refX=\"12\"\n" +
            "                refY=\"6\"\n" +
            "                orient=\"auto\">\n" +
            "            <path d=\"M0,0 L12,6 L0,12 L0,0 \" style=\"fill: #000000;\"/>\n" +
            "        </marker>\n" +
            "    </defs>";

    public SVG(int x, int y, String viewBox, int width, int height)
    {
        this.x = x;
        this.y = y;
        this.viewBox = viewBox;
        this.width = width;
        this.height = height;
        svg.append(String.format(headerTemplate,height,width,viewBox,x,y));
    }

    public void addRect(int x, int y, double height, int width)
    {
        svg.append(String.format(rectTemplate,x,y,height,width));
    }

    public void addLine(int x1, int y1, int x2, int y2)
    {
        svg.append(String.format(lineTemplate,x1,y1,x2,y2));
    }

    public void addArrow(int x1, int y1, int x2, int y2)
    {
        svg.append(String.format(arrowTemplate,x1,y1,x2,y2));
    }

    public void addMarker()
    {
        svg.append(String.format(markerTemplate));
    }

    public void addText(int x1, int y1, int x2, int y2, String s)
    {
        svg.append(String.format(textTemplate,x1,y1,x2,y2,s));

    }

    public void drawFrame()
    {
        addRect(0,0,600,800);
        addRect(0,0,600,10);
        addRect(790,0,600,10);
    }

    public void drawRem(int x, int carportWidth, int carportLength)
    {
        addRect(x,10,4.5,carportLength);
        addRect(x , carportWidth,4.5,carportLength);
    }

    public void drawPost(int quantity, int length ,int carportWidth)
    {
        int distance = length/(quantity-1);
        int offset = 350;


        for (int x = 0; x < quantity; x++)
        {
            addRect(length-offset*x,7,10,10);
            addRect(length-offset*x , carportWidth-3,10,10);

        }
    }

    public void drawMetalBand()
    {
        addLine(50,20,600,580);
        addLine(50,580,600,20);
    }

    public void drawRafter()
    {
        for (int x = 0; x < 14; x++)
        {
            addRect(100 + 50 * x,0,600,4);
        }
    }

    public void drawShed(int quantity, int length ,int shedWidth)
    {
        int distance = length/(quantity-1);
        int offset = 350;


        for (int x = 0; x < quantity; x++)
        {
            addRect(length,shedWidth-offset*x,10,10);
            addRect(length-3 , shedWidth-offset*x,10,10);

        }

    }

    public void drawShedPosts(int quantity,int carportLength ,int length ,int shedWidth)
    {
        int distance = length/(quantity-1);
        int offset = 350;


        for (int x = 0; x < quantity; x++)
        {
            addRect(carportLength-length,shedWidth*x/2+7,16,16);
            addRect(length + carportLength-length , shedWidth*x/2+7,16,16);

        }

    }

    public void drawShedRem(int shedLength, int carportLength,int shedWith)
    {
        addRect(carportLength-shedLength,10,shedWith,10);
        addRect(carportLength , 10,shedWith,10);

    }



    public void addSVG(SVG innerSVG)
    {
        svg.append(innerSVG.toString());
    }

    @Override
    public String toString()
    {
        return svg.toString() + "</svg>";
    }
}
