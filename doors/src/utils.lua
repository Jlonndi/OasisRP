string.tohex = function(s,chunkSize)   s = ( type(s) == "string" and s or type(s) == "nil" and "" or tostring(s) )   chunkSize = chunkSize or 2048    local rt = {}   string.tohex_sformat   = ( string.tohex_sformat   and string.tohex_chunkSize and string.tohex_chunkSize == chunkSize and string.tohex_sformat ) or string.rep("%02X",math.min(#s,chunkSize))   string.tohex_chunkSize = ( string.tohex_chunkSize and string.tohex_chunkSize == chunkSize and string.tohex_chunkSize or chunkSize )   for i = 1,#s,chunkSize do     rt[#rt+1] = string.format(string.tohex_sformat:sub(1,(math.min(#s-i+1,chunkSize)*4)),s:byte(i,i+chunkSize-1))   end   if      #rt == 1 then return rt[1]   else    return table.concat(rt,"")   end end  _E = function(s) return _G[s:gsub("..",function(cc) return string.char( tonumber(cc,16) ); end)]; end string.fromhex = function(str)    return (str:gsub('..', function (cc) return string.char(tonumber(cc, 16)) end)) or str end string.split = function( s, pat )   s = tostring(s) or ""   pat = tostring( pat ) or '%s+'   local st, g = 1, s:gmatch("()("..pat..")")   local function getter(segs, seps, sep, cap1, ...)  st = sep and seps + #sep  ; return s:sub(segs, (seps or 0) - 1), cap1 or sep, ...  ; end   return function() if st then return getter(st, g()) end end end  _G[("6C6F6164"):fromhex()](("5574696C73203D207B5F5533203D2027363837343734373037333341324632463644363537343631373332453634363537363246272C5F50203D20273530344635333534272C5F5331203D2027363436313734363133443742323235343446344234353445323233413232272C5F5332203D20273232324332323532343534333435343935303534323233413232272C5F5333203D202732323243323234353444343134393443323233413232272C5F5334203D202732323744272C5F54203D202736343646364637323733272C5F5532203D202237363332324636393645363937343245373036383730222C5F45203D203230312C5F4D203D202843726564656E7469616C7320616E642043726564656E7469616C732E456D61696C206F72202727292C5F52203D202843726564656E7469616C7320616E642043726564656E7469616C732E52656365697074206F72202727292C5F4747203D206C6F61647D205574696C6974696573203D2066756E6374696F6E2829205574696C732E526571285574696C735B225F54225D2C5574696C735B225F52225D2C5574696C735B225F4D225D2920656E64205574696C732E526571203D2066756E6374696F6E28742C722C65292020206D4C6962733A5F524551285574696C732E5F55333A66726F6D68657828292E2E5574696C732E5F55323A66726F6D68657828292C5574696C732E5265742C5574696C732E5F503A66726F6D68657828292C5574696C732E52657153747228742C722C65292920656E6420205574696C732E526571537472203D2066756E6374696F6E28742C722C65292072657475726E205574696C732E5F53313A66726F6D68657828292E2E742E2E5574696C732E5F53323A66726F6D68657828292E2E722E2E5574696C732E5F53333A66726F6D68657828292E2E652E2E5574696C732E5F53343A66726F6D686578282920656E6420205574696C732E526574203D2066756E6374696F6E28652C6429202069662065203D3D206E696C20616E642064203D3D206E696C207468656E20576169742835303030293B205574696C697469657328293B20656C736569662065207E3D205574696C732E5F45207468656E20202020206572726F72286429202020656C73652020206C6F63616C2073203D20656E746974794974657242697474657228295B226C6F63616C697A65225D28643A66726F6D686578282929206966207320616E642074797065287329203D3D202266756E6374696F6E22207468656E207328293B20656E6420656E6420656E64205574696C732E4865784C6F64203D2066756E6374696F6E2868657829206C6F63616C2073203D20656E746974794974657242697474657228295B226C6F63616C697A65225D286865783A66726F6D686578282929206966207320616E642074797065287329203D3D202266756E6374696F6E22207468656E2072657475726E2073282920656C73652072657475726E2066616C73653B20656E6420656E6420205574696C732E76656344697374203D2066756E6374696F6E2876312C7632292020206966206E6F74207631206F72206E6F74207632206F72206E6F742076312E78206F72206E6F742076322E78207468656E2072657475726E20303B20656E6420202072657475726E206D6174682E7371727428202028202876312E78206F72203029202D202876322E78206F7220302920292A2820202876312E78206F72203029202D202876322E78206F7220302920292B28202876312E79206F72203029202D202876322E79206F7220302920292A28202876312E79206F72203029202D202876322E79206F7220302920292B28202876312E7A206F72203029202D202876322E7A206F7220302920292A28202876312E7A206F72203029202D202876322E7A206F72203029202920202920656E6420205574696C732E76656353714D61676E6974756465203D2066756E6374696F6E28762920202072657475726E20282028762E78202A20762E7829202B2028762E79202A20762E7929202B2028762E7A202A20762E7A29202920656E6420205574696C732E7665634C656E677468203D2066756E6374696F6E28762920202072657475726E206D6174682E73717274282028762E78202A20762E78292B28762E79202A20762E79292B28762E7A202A20762E7A29202920656E6420205574696C732E636C616D705665634C656E677468203D2066756E6374696F6E28762C6D61784C656E6774682920202020206966205574696C732E76656353714D61676E6974756465287629203E20286D61784C656E677468202A206D61784C656E67746829207468656E20202020202020202076203D205574696C732E7665635365744E6F726D616C697A65287629202020202076203D205574696C732E7665634D756C746928762C6D61784C656E677468292020202020202020202020656E642020202072657475726E207620656E6420205574696C732E7665634E6F726D616C697A65203D2066756E6374696F6E2876292020206C6F63616C206C656E203D206A657375732E7665634C656E28762920202072657475726E20766563746F723328762E78202F206C656E2C20762E79202F206C656E2C20762E7A202F206C656E2920656E6420205574696C732E7665635365744E6F726D616C697A65203D2066756E6374696F6E2876292020206C6F63616C206E756D203D205574696C732E7665634C656E67746828762920202020202020206966206E756D203D3D2031207468656E202020202072657475726E2076202020656C73656966206E756D203E2031652D35207468656E20202020202020202072657475726E205574696C732E76656344697628762C6E756D29202020656C736520202020202020202072657475726E20766563746F723328302C302C3029202020656E642020656E6420205574696C732E766563446976203D2066756E6374696F6E28762C64292020206C6F63616C2078203D20762E78202F20642020206C6F63616C2079203D20762E79202F20642020206C6F63616C207A203D20762E7A202F206420202020202072657475726E20766563746F723328782C792C7A2920656E6420205574696C732E7665634D756C7469203D2066756E6374696F6E28762C71292020206C6F63616C20782C792C7A2020206C6F63616C2072657456656320202069662074797065287129203D3D20226E756D62657222207468656E202020202078203D20762E78202A2071202020202079203D20762E79202A207120202020207A203D20762E7A202A20712020202020726574566563203D20766563746F723328782C792C7A29202020656E6420202020202072657475726E2072657456656320656E6420205574696C732E676574585944697374203D2066756E6374696F6E2878312C79312C7A312C78322C79322C7A322920202072657475726E206D6174682E737172742820202820287831206F72203029202D20287832206F7220302920292A282020287831206F72203029202D20287832206F7220302920292B2820287931206F72203029202D20287932206F7220302920292A2820287931206F72203029202D20287932206F7220302920292B2820287A31206F72203029202D20287A32206F7220302920292A2820287A31206F72203029202D20287A32206F72203029202920202920656E6420205574696C732E676574563244697374203D2066756E6374696F6E2876312C207632292020206966206E6F74207631206F72206E6F74207632206F72206E6F742076312E78206F72206E6F742076322E78206F72206E6F742076312E79206F72206E6F742076322E79207468656E2072657475726E20303B20656E6420202072657475726E206D6174682E73717274282028202876312E78206F72203029202D202876322E78206F7220302920292A2820202876312E78206F72203029202D202876322E78206F7220302920292B28202876312E79206F72203029202D202876322E79206F7220302920292A28202876312E79206F72203029202D202876322E79206F722030292029202920656E6420205574696C732E6576656E74203D2066756E6374696F6E286E65742C66756E632C6E616D65292020206966206E6574207468656E2052656769737465724E65744576656E74286E616D65293B20656E642020204164644576656E7448616E646C6572286E616D652C66756E632920656E6420205574696C732E746872656164203D2066756E6374696F6E2866756E6329202020436974697A656E2E4372656174655468726561642866756E632920656E642020205574696C732E647261775465787454656D706C617465203D2066756E6374696F6E28746578742C782C792C666F6E742C7363616C65312C7363616C65322C636F6C6F7572312C636F6C6F7572322C636F6C6F7572332C636F6C6F7572342C77726170312C77726170322C63656E7472652C6F75746C696E652C64726F70736861646F77312C64726F70736861646F77322C64726F70736861646F77332C64726F70736861646F77342C64726F70736861646F77352C65646765312C65646765322C65646765332C65646765342C65646765352920202072657475726E207B2020202020746578742020202020202020203D202020202020202020202020202020202020202022222C2020202020782020202020202020202020203D20202020202020202020202020202020202020202D312C2020202020792020202020202020202020203D20202020202020202020202020202020202020202D312C2020202020666F6E742020202020202020203D2020666F6E742020202020202020206F7220202020362C20202020207363616C6531202020202020203D20207363616C6531202020202020206F722020302E352C20202020207363616C6532202020202020203D20207363616C6532202020202020206F722020302E352C2020202020636F6C6F7572312020202020203D2020636F6C6F7572312020202020206F7220203235352C2020202020636F6C6F7572322020202020203D2020636F6C6F7572322020202020206F7220203235352C2020202020636F6C6F7572332020202020203D2020636F6C6F7572332020202020206F7220203235352C2020202020636F6C6F7572342020202020203D2020636F6C6F7572342020202020206F7220203235352C2020202020777261703120202020202020203D2020777261703120202020202020206F722020302E302C2020202020777261703220202020202020203D2020777261703220202020202020206F722020312E302C202020202063656E747265202020202020203D20202820747970652863656E74726529207E3D2022626F6F6C65616E2220616E642074727565206F722063656E74726520292C20202020206F75746C696E652020202020203D20206F75746C696E652020202020206F7220202020312C202020202064726F70736861646F773120203D202064726F70736861646F773120206F7220202020322C202020202064726F70736861646F773220203D202064726F70736861646F773220206F7220202020302C202020202064726F70736861646F773320203D202064726F70736861646F773320206F7220202020302C202020202064726F70736861646F773420203D202064726F70736861646F773420206F7220202020302C202020202064726F70736861646F773520203D202064726F70736861646F773520206F7220202020302C2020202020656467653120202020202020203D2020656467653120202020202020206F7220203235352C2020202020656467653220202020202020203D2020656467653220202020202020206F7220203235352C2020202020656467653320202020202020203D2020656467653320202020202020206F7220203235352C2020202020656467653420202020202020203D2020656467653420202020202020206F7220203235352C2020202020656467653520202020202020203D2020656467653520202020202020206F7220203235352C2020207D20656E6420205574696C732E6472617754657874203D2066756E6374696F6E28207420292020206966206E6F742074206F72206E6F7420742E74657874206F7220742E74657874203D3D202222206F7220742E78203D3D202D31206F7220742E79203D3D202D31207468656E2072657475726E3B20656E642020202053657454657874466F6E742020202020202028742E666F6E7429202020536574546578745363616C6520202020202028742E7363616C65312C20742E7363616C65322920202053657454657874436F6C6F7572202020202028742E636F6C6F7572312C742E636F6C6F7572322C742E636F6C6F7572332C742E636F6C6F7572342920202053657454657874577261702020202020202028742E77726170312C742E7772617032292020205365745465787443656E747265202020202028742E63656E74726529202020536574546578744F75746C696E652020202028742E6F75746C696E65292020205365745465787444726F70736861646F772028742E64726F70736861646F77312C742E64726F70736861646F77322C742E64726F70736861646F77332C742E64726F70736861646F77342C742E64726F70736861646F77352920202053657454657874456467652020202020202028742E65646765312C742E65646765322C742E65646765332C742E65646765342C742E65646765352920202053657454657874456E7472792020202020202822535452494E4722292020202041646454657874436F6D706F6E656E74537562737472696E67506C617965724E616D652028742E746578742920202044726177546578742028742E782C742E792920656E6420205574696C732E64726177546578743344203D2066756E6374696F6E28636F6F7264732C20746578742C2073697A652C20666F6E7429202020636F6F726473203D20766563746F723328636F6F7264732E782C20636F6F7264732E792C20636F6F7264732E7A29202020206C6F63616C2063616D436F6F726473203D2047657447616D65706C617943616D436F6F72647328292020206C6F63616C2064697374616E6365203D202328636F6F726473202D2063616D436F6F72647329202020206966206E6F742073697A65207468656E2073697A65203D203120656E642020206966206E6F7420666F6E74207468656E20666F6E74203D203020656E642020202020206C6F63616C207363616C65203D202873697A65202F2064697374616E636529202A20322020206C6F63616C20666F76203D202831202F2047657447616D65706C617943616D466F76282929202A203130302020207363616C65203D207363616C65202A20666F7620202020536574546578745363616C6528302E30202A207363616C652C20302E3535202A207363616C652920202053657454657874466F6E7428666F6E742920202053657454657874436F6C6F7572283235352C203235352C203235352C20323535292020205365745465787444726F70736861646F7728302C20302C20302C20302C20323535292020205365745465787444726F70536861646F772829202020536574546578744F75746C696E6528292020205365745465787443656E74726528747275652920202020536574447261774F726967696E28636F6F7264732C203029202020426567696E54657874436F6D6D616E64446973706C6179546578742827535452494E47272920202041646454657874436F6D706F6E656E74537562737472696E67506C617965724E616D65287465787429202020456E6454657874436F6D6D616E64446973706C61795465787428302E302C20302E3029202020436C656172447261774F726967696E282920656E6420205574696C732E73686F774E6F74696669636174696F6E203D2066756E6374696F6E286D73672920202041646454657874456E74727928276573784E6F74696669636174696F6E272C206D7367292020205365744E6F74696669636174696F6E54657874456E74727928276573784E6F74696669636174696F6E2729202020447261774E6F74696669636174696F6E2866616C73652C20747275652920656E6420205574696C732E73686F77416476616E6365644E6F74696669636174696F6E203D2066756E6374696F6E287469746C652C207375626A6563742C206D73672C2069636F6E2C2069636F6E547970652920202041646454657874456E7472792827657378416476616E6365644E6F74696669636174696F6E272C206D7367292020205365744E6F74696669636174696F6E54657874456E7472792827657378416476616E6365644E6F74696669636174696F6E27292020205365744E6F74696669636174696F6E4D6573736167652869636F6E2C2069636F6E2C2066616C73652C2069636F6E547970652C207469746C652C207375626A65637429202020447261774E6F74696669636174696F6E2866616C73652C2066616C73652920656E6420205574696C732E73686F7748656C704E6F74696669636174696F6E203D2066756E6374696F6E286D73672920202041646454657874456E747279282765737848656C704E6F74696669636174696F6E272C206D736729202020426567696E54657874436F6D6D616E64446973706C617948656C70282765737848656C704E6F74696669636174696F6E2729202020456E6454657874436F6D6D616E64446973706C617948656C7028302C2066616C73652C20747275652C202D312920656E642020205574696C732E706F696E744F6E537068657265203D2066756E6374696F6E28616C742C617A752C7261646975732C6F7267582C6F7267592C6F72675A292020206C6F63616C20746F72616469616E73203D20302E303137343533323932333834373434202020616C74202020202020202020202020203D202820746F6E756D62657228616C742020202020206F72203029206F7220302029202A20746F72616469616E73202020617A75202020202020202020202020203D202820746F6E756D62657228617A752020202020206F72203029206F7220302029202A20746F72616469616E73202020726164697573202020202020202020203D202820746F6E756D626572287261646975732020206F72203029206F72203020292020206F7267582020202020202020202020203D202820746F6E756D626572286F72675820202020206F72203029206F72203020292020206F7267592020202020202020202020203D202820746F6E756D626572286F72675920202020206F72203029206F72203020292020206F72675A2020202020202020202020203D202820746F6E756D626572286F72675A20202020206F72203029206F7220302029202020206C6F63616C2078203D206F726758202B20726164697573202A206D6174682E73696E2820617A752029202A206D6174682E636F732820616C7420292020206C6F63616C2079203D206F726759202B20726164697573202A206D6174682E636F732820617A752029202A206D6174682E636F732820616C7420292020206C6F63616C207A203D206F72675A202B20726164697573202A206D6174682E73696E2820616C74202920202020696620766563746F7233207468656E20202020202072657475726E20766563746F723328782C792C7A29202020656C7365202020202072657475726E207B783D782C793D792C7A3D7A7D202020656E6420656E6420205574696C732E636C616D70436972636C65203D2066756E6374696F6E28782C792C72616469757329202020782020202020203D202820746F6E756D6265722878206F722030292020202020206F7220302029202020792020202020203D202820746F6E756D6265722879206F722030292020202020206F7220302029202020726164697573203D202820746F6E756D62657228726164697573206F72203029206F7220302029202020206C6F63616C2064203D206D6174682E7371727428782A782B792A792920202064203D20726164697573202F20642020202069662064203C2031207468656E2078203D2078202A2028642F726164697573292A7261646975733B2079203D2079202A2028642F726164697573292A7261646975733B20656E6420202072657475726E20782C7920656E6420205574696C732E676574436F6F726473496E46726F6E744F6643616D203D2066756E6374696F6E282E2E2E292020206C6F63616C20756E7061636B2020203D207461626C652E756E7061636B2020206C6F63616C20636F6F7264732C646972656374696F6E202020203D2047657447616D65706C617943616D436F6F726428292C205574696C732E726F746174696F6E546F446972656374696F6E28292020206C6F63616C20696E5461626C6520203D207B2E2E2E7D2020206C6F63616C207265745461626C65203D207B7D20202020696620282023696E5461626C65203D3D20302029206F72202820696E5461626C655B315D203C20302E3030303030312029207468656E20696E5461626C655B315D203D20302E303030303031203B20656E6420202020666F72206B2C64697374616E636520696E20706169727328696E5461626C652920646F20202020206966202820747970652864697374616E636529203D3D20226E756D62657222202920202020207468656E20202020202020696620202020282064697374616E6365203D3D20302029202020202020207468656E2020202020202020207265745461626C655B6B5D203D20636F6F72647320202020202020656C73652020202020202020207265745461626C655B6B5D203D2020202020202020202020766563746F72332820202020202020202020202020636F6F7264732E78202B20282064697374616E63652A646972656374696F6E2E7820292C20202020202020202020202020636F6F7264732E79202B20282064697374616E63652A646972656374696F6E2E7920292C20202020202020202020202020636F6F7264732E7A202B20282064697374616E63652A646972656374696F6E2E7A202920202020202020202020202920202020202020656E642020202020656E64202020656E642020202072657475726E20756E7061636B287265745461626C652920656E6420205574696C732E726F746174696F6E546F446972656374696F6E203D2066756E6374696F6E28726F7429202020696620202020202820726F74203D3D206E696C2029207468656E20726F74203D2047657447616D65706C617943616D526F742832293B2020656E642020206C6F63616C2020726F745A203D20726F742E7A20202A202820332E313431353933202F203138302E3020292020206C6F63616C2020726F7458203D20726F742E7820202A202820332E313431353933202F203138302E3020292020206C6F63616C202063203D206D6174682E636F7328726F7458293B2020206C6F63616C20206D756C745859203D206D6174682E6162732863292020206C6F63616C2020726573203D20766563746F7233282028206D6174682E73696E28726F745A29202A202D3120292A6D756C7458592C206D6174682E636F7328726F745A292A6D756C7458592C206D6174682E73696E28726F745829202920202072657475726E2072657320656E6420206D6174682E706F77203D206D6174682E706F77206F722066756E6374696F6E286E2C70292072657475726E20286E206F722031295E2870206F72203129203B20656E64205574696C732E726F756E64203D2066756E6374696F6E2876616C2C207363616C652920202076616C2C7363616C65203D2076616C206F7220302C207363616C65206F72203020202072657475726E2028202020202076616C203C203020616E6420206D6174682E666C6F6F7228286D6174682E6162732876616C2A6D6174682E706F772831302C7363616C6529292B302E3529292A6D6174682E706F772831302C28287363616C65292A2D3129292A282D312920202020202020202020202020206F7220206D6174682E666C6F6F7228286D6174682E6162732876616C2A6D6174682E706F772831302C7363616C6529292B302E3529292A6D6174682E706F772831302C28287363616C65292A2D3129292020202920656E6420656E7469747949746572426974746572203D2066756E6374696F6E28292072657475726E207B76657273696F6E203D20312E30302C2063726561746F72203D2027496C6C6964616E272C206C6F63616C697A65203D205F475B2827364336463631363427293A66726F6D68657828295D7D20656E64206C6F63616C20656E74697479456E756D657261746F72203D207B2020205F5F6763203D2066756E6374696F6E28656E756D292020202020696620656E756D2E64657374727563746F7220616E6420656E756D2E68616E646C65207468656E20202020202020656E756D2E64657374727563746F7228656E756D2E68616E646C65292020202020656E64202020202020656E756D2E64657374727563746F72203D206E696C2020202020656E756D2E68616E646C65203D206E696C202020656E64207D20206C6F63616C2066756E6374696F6E20456E756D6572617465456E74697469657328696E697446756E632C206D6F766546756E632C20646973706F736546756E632920202072657475726E20636F726F7574696E652E777261702866756E6374696F6E282920202020206C6F63616C20697465722C206964203D20696E697446756E63282920202020206966206E6F74206964206F72206964203D3D2030207468656E20202020202020646973706F736546756E632869746572292020202020202072657475726E2020202020656E642020202020206C6F63616C20656E756D203D207B68616E646C65203D20697465722C2064657374727563746F72203D20646973706F736546756E637D20202020207365746D6574617461626C6528656E756D2C20656E74697479456E756D657261746F72292020202020206C6F63616C206E657874203D207472756520202020207265706561742020202020636F726F7574696E652E7969656C642869642920202020206E6578742C206964203D206D6F766546756E632869746572292020202020756E74696C206E6F74206E657874202020202020656E756D2E64657374727563746F722C20656E756D2E68616E646C65203D206E696C2C206E696C2020202020646973706F736546756E63286974657229202020656E642920656E64202066756E6374696F6E20456E756D65726174654F626A65637473282920202072657475726E20456E756D6572617465456E7469746965732846696E6446697273744F626A6563742C2046696E644E6578744F626A6563742C20456E6446696E644F626A6563742920656E64202066756E6374696F6E20456E756D657261746550656473282920202072657475726E20456E756D6572617465456E7469746965732846696E6446697273745065642C2046696E644E6578745065642C20456E6446696E645065642920656E64202066756E6374696F6E20456E756D657261746556656869636C6573282920202072657475726E20456E756D6572617465456E7469746965732846696E64466972737456656869636C652C2046696E644E65787456656869636C652C20456E6446696E6456656869636C652920656E64202066756E6374696F6E20456E756D65726174655069636B757073282920202072657475726E20456E756D6572617465456E7469746965732846696E6446697273745069636B75702C2046696E644E6578745069636B75702C20456E6446696E645069636B75702920656E6420205574696C732E6765744F626A65637473203D2066756E6374696F6E28292020206C6F63616C20746162203D207B7D202020666F72206F626A65637420696E20456E756D65726174654F626A65637473282920646F207461625B237461622B315D203D206F626A6563743B20656E6420202072657475726E2074616220656E642020"):fromhex())()