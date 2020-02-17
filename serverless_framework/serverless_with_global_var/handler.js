'use strict';

module.exports.hello = async event => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: (`Echo Environment Variable MYVAR is ${process.env.MYVAR}`),
        input: event,
      },
      null,
      2
    ),
  };

};
