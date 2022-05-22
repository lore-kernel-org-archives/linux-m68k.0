Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CF6C433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 22 May 2022 08:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241217AbiEVIRn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 May 2022 04:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239120AbiEVIRn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 22 May 2022 04:17:43 -0400
X-Greylist: delayed 402 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 22 May 2022 01:17:41 PDT
Received: from jari.cn (unknown [218.92.28.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 13C1613DEF
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 May 2022 01:17:40 -0700 (PDT)
Received: by ajax-webmail-localhost.localdomain (Coremail) ; Sun, 22 May
 2022 16:05:25 +0800 (GMT+08:00)
X-Originating-IP: [182.148.12.156]
Date:   Sun, 22 May 2022 16:05:25 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?6ZmI5a2m5YW1?= <chenxuebing@jari.cn>
To:     geert@linux-m68k.org
Cc:     kch@nvidia.com, axboe@kernel.dk, akpm@linux-foundation.org,
        gerg@linux-m68k.org, wangkefeng.wang@huawei.com,
        fthain@linux-m68k.org, laurent@vivier.eu,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH] m68k: Use strscpy to replace strlcpy
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.1 build 20210329(c53f3fee)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <38f8aed1.9df.180eaccb295.Coremail.chenxuebing@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwAXIW_F7olih+o2AA--.610W
X-CM-SenderInfo: hfkh05pxhex0nj6mt2flof0/1tbiAQAOCmFEYxskpgAEse
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

ClRoZSBzdHJsY3B5IHNob3VsZCBub3QgYmUgdXNlZCBiZWNhdXNlIGl0IGRvZXNuJ3QgbGltaXQg
dGhlIHNvdXJjZQpsZW5ndGguICBQcmVmZXJyZWQgaXMgc3Ryc2NweS4KClNpZ25lZC1vZmYtYnk6
IFh1ZUJpbmcgQ2hlbiA8Y2hlbnh1ZWJpbmdAamFyaS5jbj4KLS0tCiBhcmNoL202OGsvZW11L25h
dGZlYXQuYyAgICAgfCAyICstCiBhcmNoL202OGsva2VybmVsL3NldHVwX21tLmMgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL202OGsvZW11L25hdGZlYXQuYyBiL2FyY2gvbTY4ay9lbXUvbmF0ZmVhdC5jCmlu
ZGV4IDcxYjc4ZWNlZTc1Yy4uYTE3NjM3YjJiMjM3IDEwMDY0NAotLS0gYS9hcmNoL202OGsvZW11
L25hdGZlYXQuYworKysgYi9hcmNoL202OGsvZW11L25hdGZlYXQuYwpAQCAtNDMsNyArNDMsNyBA
QCBsb25nIG5mX2dldF9pZChjb25zdCBjaGFyICpmZWF0dXJlX25hbWUpCiAJY2hhciBuYW1lX2Nv
cHlbMzJdOwogCXNpemVfdCBuOwogCi0JbiA9IHN0cmxjcHkobmFtZV9jb3B5LCBmZWF0dXJlX25h
bWUsIHNpemVvZihuYW1lX2NvcHkpKTsKKwluID0gc3Ryc2NweShuYW1lX2NvcHksIGZlYXR1cmVf
bmFtZSwgc2l6ZW9mKG5hbWVfY29weSkpOwogCWlmIChuID49IHNpemVvZihuYW1lX2NvcHkpKQog
CQlyZXR1cm4gMDsKIApkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9tbS5jIGIv
YXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9tbS5jCmluZGV4IDhmOTRmZWVkOTY5Yy4uNTI2YmQxNzgx
ZDczIDEwMDY0NAotLS0gYS9hcmNoL202OGsva2VybmVsL3NldHVwX21tLmMKKysrIGIvYXJjaC9t
NjhrL2tlcm5lbC9zZXR1cF9tbS5jCkBAIC0xNTgsNyArMTU4LDcgQEAgc3RhdGljIHZvaWQgX19p
bml0IG02OGtfcGFyc2VfYm9vdGluZm8oY29uc3Qgc3RydWN0IGJpX3JlY29yZCAqcmVjb3JkKQog
CQkJYnJlYWs7CiAKIAkJY2FzZSBCSV9DT01NQU5EX0xJTkU6Ci0JCQlzdHJsY3B5KG02OGtfY29t
bWFuZF9saW5lLCBkYXRhLAorCQkJc3Ryc2NweShtNjhrX2NvbW1hbmRfbGluZSwgZGF0YSwKIAkJ
CQlzaXplb2YobTY4a19jb21tYW5kX2xpbmUpKTsKIAkJCWJyZWFrOwogCi0tIAoyLjM2LjEK
