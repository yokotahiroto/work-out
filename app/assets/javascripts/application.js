// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require chartkick
//= require Chart.bundle
//= require turbolinks
//= require_tree .

//アニメーション
const targetElement = document.getElementsByClassName("animationTarget");
document.addEventListener("scroll", function() {
  for (let i = 0; i < targetElement.length; i++) { //targetElementの数だけ回す
    const getElementDistance = targetElement[i].
    getBoundingClientRect().top + targetElement[i].clientHeight *.6;//要素の上からの距離を測る、６割見えたらアニメーション開始
    if (window.innerHeight > getElementDistance) {
      targetElement[i].classList.add("show");
    }
  }
});
//アニメーション

//トップへ戻る
document.addEventListener("turbolinks:load", function () {
  $(function() {
    $('#top-btn a').on('click',function(event){
      $('body, html').animate({
        scrollTop:0
      }, 800);
      event.preventDefault();
    });
  });
});
//トップへ戻る

//タブメニュー
document.addEventListener('turbolinks:load',function(){
  $(function() {
  let tabs = $(".tab"); // tabのクラスを全て取得し、変数tabsに配列で定義
  $(".tab").on("click", function() { // tabをクリックしたらイベント発火
    $(".active").removeClass("active"); // activeクラスを消す
    $(this).addClass("active"); // クリックした箇所にactiveクラスを追加
    const index = tabs.index(this); // クリックした箇所がタブの何番目か判定し、定数indexとして定義
    $(".content").removeClass("show").eq(index).addClass("show"); // showクラスを消して、contentクラスのindex番目にshowクラスを追加
  });
});
// タブメニュー

// 検索フォーム
  $('.search__form__input').on('keyup', function(e){
      Rails.fire($(".search__form")[0], "submit");
  });
});
// 検索フォーム

