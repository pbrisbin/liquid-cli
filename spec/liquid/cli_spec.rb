require 'spec_helper'

describe Liquid::Cli do
  it "works" do
    liquid = described_class.new(<<-EOJSON)
    {
      "products": [
        {
          "name": "Product One",
          "price": "$19.99",
          "description": "The first description"
        },
        {
          "name": "Product Two",
          "price": "$29.99",
          "description": "The second description"
        }
      ]
    }
    EOJSON

    rendered = liquid.render(<<-EOTEMPLATE)
    <ul id="products">
      {% for product in products %}
        <li>
        <h2>{{ product.name }}</h2>
        Only {{ product.price }}

        {{ product.description }}
        </li>
      {% endfor %}
    </ul>
    EOTEMPLATE

    expect(rendered).to eq <<-EOOUTPUT
    <ul id="products">
      
        <li>
        <h2>Product One</h2>
        Only $19.99

        The first description
        </li>
      
        <li>
        <h2>Product Two</h2>
        Only $29.99

        The second description
        </li>
      
    </ul>
    EOOUTPUT
  end
end
