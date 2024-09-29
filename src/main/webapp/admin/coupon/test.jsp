<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Coupon Benefit Type</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
			console.log("123");

            function updateBenefitDisplay() {
                var selectedValue = $("select[name='fbenefit_parent_type']").val();
                
                if (selectedValue === "A") {
                    $("#sp_benefit_price").show().html('<input type="text" class="fText right" name="fbenefit_price" value="0" style="width:50px;"> 원');
                } else if (selectedValue === "B") {
                    $("#sp_benefit_price").show().html('<input type="text" class="fText right" name="fbenefit_price" value="0" style="width:50px;"> %');
                } else {
                    $("#sp_benefit_price").hide();
                }
            }

            // 페이지 로드 시 초기 상태 설정
            updateBenefitDisplay();

            // 옵션 변경 시 업데이트
            $("select[name='fbenefit_parent_type']").on('change', function(){
                updateBenefitDisplay();
            });

            // 초기 상태에서는 숨기기
            $("#sp_benefit_price").hide();
        });
    </script>
</head>
<body>
    <table>
        <tr benefit-type="tr_F">
            <th scope="row">혜택구분<strong class="icoRequired">필수</strong></th>
            <td>
                <div class="mForm">
                    <input type="hidden" name="fbenefit_type" value="A">
                    <select name="fbenefit_parent_type">
                        <option value="">선택하세요</option>
                        <option value="A">할인금액</option>
                        <option value="B">할인율</option>
                    </select>
                    <span id="sp_benefit_price"></span>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
