Return-Path: <SRS0=U4C4=7M=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C83C433E0
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 16:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 384902077D
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 16:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbgE3QT0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 30 May 2020 12:19:26 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:35219 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728797AbgE3QTZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 30 May 2020 12:19:25 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M433w-1jf4Cc3840-0001Vz; Sat, 30 May 2020 18:19:18 +0200
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
References: <ff031d61-c6d7-dacc-f656-da42ad729e53@physik.fu-berlin.de>
 <54998b37-e607-b8da-fe11-8a719531fba5@gmail.com>
 <b13f2500-0c31-1e6f-19f2-f04ea58edde3@physik.fu-berlin.de>
 <1856e243-11fd-e03a-ee90-23167b90f46d@vivier.eu>
 <aa55272a-74c9-0583-afce-5a315b7d5401@physik.fu-berlin.de>
From:   Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: Kernel crash on qemu-m68k-system while building r-cran packages
Message-ID: <3777125b-960d-9772-69e3-50bc5132e323@vivier.eu>
Date:   Sat, 30 May 2020 18:19:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <aa55272a-74c9-0583-afce-5a315b7d5401@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NWsgJbAx1YjeDk/juwUS+lsYzxjKaIUNI0fkIXLp3WKXba9gRkz
 jhOpQY3xVt0fBKAHfMA7KKU7HEji7ZLqn/n25u2aXk/UNNoe83DFDs9zEeIOEc94ycTFCYv
 n5tktkpWn+vNFiXTdfSMjDx8y0Jvylkg2wVzbydKT4+owSS7oJmDnYGnHQmYVWF38CzuzDx
 lQY9SNlrSgNZQGI6jDxnw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VG/P78d276Q=:Zln8Sigz8rGgcS4xPMUXQq
 HeFUSFaw2GN6Z3YjeMhZ9xaXIuVYOEPO4zqbz4Oppkybr8UtChDsuopY6/j4R/BW9bbUfmKXC
 ffvBWEuZ7oEtwY7jfFFiVBGTcWvfqqApy++Lyf8ym50GrW5zLiWzB0Sa+215MuHxTvVlIWkn5
 spvP1StEWTbLaHwc0z5F9sp8kU3MCKTdn5k2B5jQwkFu9Q0Z4B760iqB8sfEabKXDwOiT8URB
 UU1UJ9lzJpcoYOusNZyby5d5B9oS+InZS3nhGhpFv+DCYxamWjSeUgemfAB98Ag3e+EUkTJ+F
 EPBOVAlyyh+J3oS9qKse/nq8Th1ZD34UDT3Q67zYZ5MXOqVFn8bk51geJqzG3Pa4mWmHaoH1c
 RmgBlsSdH9qq2m6yRbjmqqt+Q2g+7oWaJa2ceE3AaDEsS+KkFjZ9coIm7q4NmENipHDNM29tT
 Iwwf29vcLITwcHs16DyFfsY541kHSqdHe9goLjKw8sN6RRQRRmjC/aRPHmPD2IBGNPRhGBWtL
 v4dnMVm3XtNMHr7I7Eq44W2JAQxn7TcAwFZ7wLMUG05vwdWUIA+bNZ3RkhVUQ6cHQaI7MaYSu
 xnYB4DbkwZqP0/mN/EvX+0S1lNt1UF5lQGVaOa/Bi20qKpYfLVy2SkC3+PB4KLz4PI/guRnn5
 3+r36LZ3MUMwiUdbj2gQOJ98SOXklNmNgD3a1NR5iZ/MJPflofISkGkKJKE9VSc6aGLB1HAyE
 xyARPtOLWcQNae6wOkQGOl+izr8tV4E79gl2ouBZVQE97Y3uHJEjbkht4tO1mpe/XuXBg0jPn
 9eAaIOl7dPLdroBSxquQ7Tn7WPFRlLUz5AAwKNpXlyrJkHx7xML1DpesKzzzWXKyi4e/Jt+
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Le 30/05/2020 à 17:27, John Paul Adrian Glaubitz a écrit :
> Hi Laurent!
> 
> On 5/30/20 5:12 PM, Laurent Vivier wrote:
>> As the package is available, I've been able to reproduce the problem
>> with logs enabled. Apparently the instruction is not decoded correctly:
>>
>> ----------------
>> IN:
>> 0x00016a2c:  fmovel #0,%fpsr
>> Disassembler disagrees with translator over instruction decoding
>> Please report this to qemu-devel@nongnu.org
>>
>> OP:
>>  ld_i32 tmp0,env,$0xfffffffffffffff0
>>  movi_i32 tmp1,$0x0
>>  brcond_i32 tmp0,tmp1,lt,$L0
>>
>>  ---- 00016a2c 00000000
>>  movi_i32 PC,$0x16a2c
>>  movi_i32 tmp0,$0x3
>>  call raise_exception,$0x0,$0,env,tmp0
>>  set_label $L0
>>  exit_tb $0x7fc2a0da5643
>>
>> INT  49331: Address Error(0xc) pc=00016a2c sp=3cc91f30 sr=2004
>>
>> I try to fix that...
> 
> Ah, cool. Thanks a lot. And sorry for not replying earlier, I missed your
> previous mail.

No problem.

I've investigated and the fmovel with immediate value is not implemented...

The following patch fixes the crash but then I have a soft lockup. IT
needs more investigation.

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 0f80888203d3..c093f6c683e8 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4936,6 +4936,20 @@ static void gen_op_fmove_fcr(CPUM68KState *env,
DisasContext *s,
             gen_store_fcr(s, AREG(insn, 0), mask);
         }
         return;
+    case 7: /* Immediate */
+        if (REG(insn, 0) == 4) {
+            if (is_write ||
+                (mask != M68K_FPIAR && mask != M68K_FPSR &&
+                 mask != M68K_FPCR)) {
+                gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
+                return;
+            }
+            tmp = tcg_const_i32(read_im32(env, s));
+            gen_store_fcr(s, tmp, mask);
+            tcg_temp_free(tmp);
+            return;
+        }
+        break;
     default:
         break;
     }

Thanks,
Laurent

