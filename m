Return-Path: <SRS0=U4C4=7M=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52354C433DF
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 15:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 310BC20715
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 15:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgE3PM0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 30 May 2020 11:12:26 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50249 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbgE3PMZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 30 May 2020 11:12:25 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MEFnP-1jpBVk3Ivd-00AHhy; Sat, 30 May 2020 17:12:18 +0200
Subject: Re: Kernel crash on qemu-m68k-system while building r-cran packages
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Debian m68k <debian-68k@lists.debian.org>
References: <ff031d61-c6d7-dacc-f656-da42ad729e53@physik.fu-berlin.de>
 <54998b37-e607-b8da-fe11-8a719531fba5@gmail.com>
 <b13f2500-0c31-1e6f-19f2-f04ea58edde3@physik.fu-berlin.de>
From:   Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1856e243-11fd-e03a-ee90-23167b90f46d@vivier.eu>
Date:   Sat, 30 May 2020 17:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b13f2500-0c31-1e6f-19f2-f04ea58edde3@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/ZE27/Oh0NLFAMoxMt9a3iW6NkAWrxZYpQtf6Upoq3aYuauVMuu
 o2nJst03QLpphSM7nCFru9N/Gfq7TkIhLA6bW7griLaklRw+yb4+fMouMKA5gaAC5+LRWoR
 tAVEbwea6Bb1fWB1tvPf+vhdEAifSnsFD9Iq8eLIN4LFqIgIkLK9hCzQRphmmXGMTcLdLkm
 8MwBddOhRUKkB39s/yrjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uTh0Xvs+SHk=:tfTnik+WnMkYGKOw4MQMBT
 YfN42/81pzjJz0dpQD/Tz9SabIEzFkwEcCa3L6/C+r7bsdVxvrFT+GSj0ynOaIx3BJq9ipDRv
 d7ZlDqz4/a/p4lIJKWjXR0JhloMmeOVqFzTgSIvg/ahDlI3wdzPjT/FssBQp5mwYt5wNoPgXE
 5dzZY969B1uW2DWsEPDgrZIOkC/mVe+fXAVQCjqLl1KZMxk25xceHenPTkzrAl/dYXGF9iFMW
 GlXHM2ehbDpxjkebPHweGH1JZNaDsyAaRnE+6QQe4EO9gtsFqpUHBQbtdSUb/B105h3/RdLu8
 z75otLgnjPhtFZP4gKI1suBv2tCui76xrMJjV2j0Tds9LPMt/JNMfeaQ0bfjdKrS8bXVvsJnM
 8aB+uJfpq3gmJ7wpoOcuQK4uanLB5X1miJCIKuEiCKDPGsxdfxhZDpA22rYvYHMkFVyHiGIza
 Yhqufaojw4QyqTsh09BPI6fA4KGQdh/NvieF5fYv26EEC+wlOhhY/y51enr6N6Cmyu9fR0LeS
 Wnsb4Udrm+Ql4asVfxLMrXUDXPzyDJerj3Q7dGqjAx3KdMP5L2lVbEqRe+e7IF/P7LqwZ2OMG
 P6ah1oyR5VehWE5YIHRwWu0AfDDcJOtYxXhO/i5dNgxivHdsn6O6k253pmj3K5g1TVqoqgto+
 s7rJenaQOBj3M1egVx8XAs/ThqJbP6D8nT8rzfVC+hYSCdh/pICUmeBbYBjylOq7nnDtCwm9g
 EKN/GgUC+qs1oDiVEILRIEPIS7xYJm+cXHNny8HC2cjCAhowLqpxSMoRjlx4iVJAm62DATa0V
 Efh0K1yc65lfGt0WAerQz9s4By9UxVEft6lvtGRczexrHWV1bPCBQyMdOXr2ZsrVTcOLNeV
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Le 30/05/2020 à 13:49, John Paul Adrian Glaubitz a écrit :
> Hi Michael!
> 
> On 5/30/20 1:49 AM, Michael Schmitz wrote:
>> Can you try to run that R binary on a real 060 or 040?
> Works fine on elgar:
> 
> root@elgar:~> R


As the package is available, I've been able to reproduce the problem
with logs enabled. Apparently the instruction is not decoded correctly:

----------------
IN:
0x00016a2c:  fmovel #0,%fpsr
Disassembler disagrees with translator over instruction decoding
Please report this to qemu-devel@nongnu.org

OP:
 ld_i32 tmp0,env,$0xfffffffffffffff0
 movi_i32 tmp1,$0x0
 brcond_i32 tmp0,tmp1,lt,$L0

 ---- 00016a2c 00000000
 movi_i32 PC,$0x16a2c
 movi_i32 tmp0,$0x3
 call raise_exception,$0x0,$0,env,tmp0
 set_label $L0
 exit_tb $0x7fc2a0da5643

INT  49331: Address Error(0xc) pc=00016a2c sp=3cc91f30 sr=2004

I try to fix that...

Thanks,
Laurent
