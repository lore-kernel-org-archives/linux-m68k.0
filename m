Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D122C77B75
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 11:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjEWLMW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 May 2023 07:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjEWLMW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 May 2023 07:12:22 -0400
Received: from welho-filter2.welho.com (welho-filter2b.welho.com [83.102.41.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF251C4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 04:12:10 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by welho-filter2.welho.com (Postfix) with ESMTP id 927EA3FE16;
        Tue, 23 May 2023 14:12:07 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp1.welho.com ([IPv6:::ffff:83.102.41.84])
        by localhost (welho-filter2.welho.com [::ffff:83.102.41.24]) (amavisd-new, port 10024)
        with ESMTP id Zs69O9pyVv1R; Tue, 23 May 2023 14:12:07 +0300 (EEST)
Received: from [192.168.0.20] (89-27-40-192.bb.dnainternet.fi [89.27.40.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by welho-smtp1.welho.com (Postfix) with ESMTPSA id 06EF37A;
        Tue, 23 May 2023 14:12:04 +0300 (EEST)
Message-ID: <ee3cdd7b-c2b7-792e-e6ad-39fc6a1f817c@helsinkinet.fi>
Date:   Tue, 23 May 2023 14:12:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/1] m68k: Move signal frame following exception on
 68020/030
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org
References: <cover.1683365892.git.fthain@linux-m68k.org>
 <9e66262a754fcba50208aa424188896cc52a1dd1.1683365892.git.fthain@linux-m68k.org>
 <CAMuHMdX_0F0hSZKqBBCN3876BmfwbQb1_+N3h-V8xs5ouRXF=A@mail.gmail.com>
 <14e09781-6ffd-0834-fba4-427e5030f2be@gmail.com>
Content-Language: en-US
From:   Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <14e09781-6ffd-0834-fba4-427e5030f2be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On 23.5.2023 4.11, Michael Schmitz wrote:
> On 22/05/23 23:41, Geert Uytterhoeven wrote:
...
>> I plan to send this upstream later this week, so any additional
>> testing would be appreciated.
> 
> I've given this some lengthy stress testing, and haven't seen it fail once.
> 
> In contrast, various attempts of mine to improve on the concept (by only 
> moving the signal frame away from the USP in case it's likely to clash) 
> sometimes came up against a kernel bus error in setup_frame() when 
> copying the signo to the signal frame. I must be making some incorrect 
> assumptions still ...
> 
> Limiting the signal frame shift to bus fault exceptions that happen 
> mid-instruction is not too much of an overhead even in low memory 
> settings, and using 256 bytes (the largest possible operand size, i.e. 
> the largest adjustment to USP that might occur on completion of the 
> interrupted instruction) did not seem to cause any issues with stack 
> growth either.
> 
> I can give this some more testing in ARAnyM (extending the stack shift 
> to format 7 frames) but I'd say it's got as much testing on 030 hardware 
> as we can do.

Aranym emulates only 040 (without CPU cache).

For 030 system emulation, you can use either WinUAE (Amiga) or Hatari 
(Atari).

Those emulate (using WinUAE CPU core) all 68000 - 68060 models, 
including MMU *and* CPU cache.

Note: MMU+cache combination has some issues with Linux on Hatari though, 
so you need to disable cache & prefetch emulation to be able to run 
Linux user-space with Hatari [1].  Apparently these issues do not happen 
on WinUAE, so that seems better 030 Linux test platform for now.


	- Eero

[1] https://hatari.tuxfamily.org/doc/m68k-linux.txt
