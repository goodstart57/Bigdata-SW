// 서브메뉴 제어를 위한 스크립트
$(function() {
    $(".main-menu>li").hover(
        function() {
            $(this).children("ul").css("display", "block");
        },
        function() {
            $(this).children("ul").css("display", "none");
        }
    );
    $(".main-menu span").focusin(
        function() {
            $(this).siblings("ul").css("display", "block");
        }
    );
    $(".main-menu ul li:last-child a").focusout(
        function() {
            $(this).parent().parent("ul").css("display", "none");
        }
    );
});

//2017-06-29 15:04
// $(function() {
//     $(".main-menu > li").hover(
//         // 내부적으로 if문이 작동한다 첫번째는 참 두번째는 거짓
//         function() {
//             $(this).children("ul").css("display", "block");
//         },
//         function() {
//             $(this).children("ul").css("display", "none");
//         }
//     );

//     $(".main-menu>li>span").focusin(
//         function() {
//             $(this).siblings("ul").css("display", "block");
//         }
//     );
//     $(".main-menu ul li:last-child a").focusout(
//         function() {
//             $(this).parent().parent().css("display", "none");
//         }
//     );
// });