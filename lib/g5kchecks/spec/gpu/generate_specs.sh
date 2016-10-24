#!/bin/bash

if [ -e "spec.rb" ]; then
    rm spec.rb
fi

while read PROPERTY_NAME; do
    cat >> spec.rb <<- EOM
    it "should have the correct $PROPERTY_NAME" do
      ${PROPERTY_NAME}_api = ""
      ${PROPERTY_NAME}_api = @api[dev[0]]['$PROPERTY_NAME'] if @api_desc
      ${PROPERTY_NAME}_ohai = dev[:$PROPERTY_NAME]
      ${PROPERTY_NAME}_ohai.should eql(${PROPERTY_NAME}_api), "#{${PROPERTY_NAME}_ohai}, #{${PROPERTY_NAME}_api}, gpus, #{name}, ${PROPERTY_NAME}"
    end

EOM
done < properties.txt

exit 0
