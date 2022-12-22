import { DefaultRubyVM } from "ruby-head-wasm-wasi/dist/browser.umd.js";
export var UnloosenRubyVM;

// メッセージ出力
export const printInitMessage = () => {
    evalRubyCode(`
    puts <<-"INF"
Ruby Browser Extension by logiteca7/aaaa777
Ruby version: #{RUBY_DESCRIPTION}
    INF
`);
};

// ファイルのパスをchrome拡張用のURL形式に変換
const buildExtensionURL = (filepath) => {
    return new URL(chrome.runtime.getURL(filepath));
}

// RubyVMを初期化する関数
export const initRubyVM = async () => {
    const response = await fetch(buildExtensionURL("ruby.wasm"));
    const buffer = await response.arrayBuffer();
    const module = await WebAssembly.compile(buffer);
    const { vm } = await DefaultRubyVM(module);

    UnloosenRubyVM = vm;
};

// URLからrubyファイルを実行
export const evalRubyFileFromURL = async (url) => {
    await fetch(url)
        .then((response) => response.text())
        .then((text) => evalRubyCode(text));
};

// Chrome拡張のrubyファイルを実行
export const evalRubyFileFromExtension = async (filepath) => {
    await evalRubyFileFromURL(buildExtensionURL(filepath));
}

// 文字列のrubyコードを実行
export const evalRubyCode = async (code) => {
    UnloosenRubyVM.eval(code);
}