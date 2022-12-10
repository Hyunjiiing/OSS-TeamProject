module.exports = {
  root: true,
  env: {
    es6: true,
    node: true,
  },
  extends: ["eslint:recommended", "google"],
  rules: {
    quotes: ["error", "double"], // ''는 오류, ""는 정상
    indent: "off", // 띄어쓰기 규칙 사용x
    semi: "off", // 문장 끝에 세미콜론 규칙 사용 x
    "max-len": "off", // 한줄에 표현할 수 있는 max길이 규칙 사용 x
  },
};
