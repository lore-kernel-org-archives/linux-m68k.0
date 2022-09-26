Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E25C32771
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 21:42:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbiIZVmU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 17:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiIZVmQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 17:42:16 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CD3A5701
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 14:42:12 -0700 (PDT)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MLRI3-1ouKQJ34Pz-00IUBN; Mon, 26 Sep 2022 23:42:04 +0200
Message-ID: <5ebf4a4a-031b-0706-d199-d116cd518226@vivier.eu>
Date:   Mon, 26 Sep 2022 23:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4
 bytes
Content-Language: fr
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
 <20220926113900.1256630-2-Jason@zx2c4.com>
 <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu>
 <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
From:   Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rmS7G+wqvFmGDzi9InR3ESnQmpnIU9A1yKPeAciz5Ir2Ga7eqfc
 kOOZ0/Q67vgj3ajBPPoJACWJP1gcj3Bcm4zXWtSX+KHyTvGH1+Jmhocj5LkmpTpRpEWotcD
 DMZDgw5PMKFxVXSs2Ys3Z0Gpe00gZUm5PQDcjcDhw7SDlu3rrcWTkAQky3uSpJI5TDMS1O9
 NnGluHrWR+Ay/Pm2Ga29w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nz0mczb1mqw=:6LLZ+MUavioibJ6oXFuReR
 aBe5e2/diFzTV4AXMsqmEazH424/MI2l2NjA+Uvw0xZ6JATYthsZ95ulzBLfptUgRnrxcjU7Q
 74j5zzi7pKGda4Qf9ocpIxCem9WXa1O1cIU0k3eAM+rPFpKR5L4u90yiwXhA9oorKT5lk3+sD
 zfjBc2nGw5cPFEZ9r6A4EDBr2Htxq9RlxPGfPSvIJxAT4uxBUB8AIpCiRu+g1VTpd8cxJamXi
 /ikWCvIC3Gj5FMkqr422qrekDoUDAasM1yczoAlyjzc4IWo5TCXnMIIDX9f4AyvnDvo9X1toC
 /d9z7clyD75xMdtu/j/zf/a9xUxpUTnAEOZwEHix6co9Iywcb+HnXboOrjxKEYyTjcV+kueuo
 SHI9IHPcR82+4Kz8dXC3OtvEafwMN5Aq3/wsXzksY2CDt1MC2iWCJBcRokQGIfFvNGq9vVa55
 ISy/OG0zvzkV+YoF9xd1ybh2SihNdi+g5rDeck4aimzo0Mf0Jg22PVOd+SfGPiX0KEhlgtwnO
 O/dTy4tukpkgzaZR9SQCWDfr7A0PvEaJq9WYsYM92qnbM2cnD/MhgchyGtcRKaGtLU/7L7krr
 31b1C4TpU9DprVthgQcFOR9zbCc8xHueZ5IWIdcjKEghvIkClXnMmmN2eb8SkcoMkvB8dHSzy
 rHxhdc2x8phrpk2AsIEYho6sBVjVSpggCYqeAzT2cbYZ9HVi2F4Mn1h6KPAsHe9N0OLNcXg1d
 miSDCP5cia/EGPBVIQ+PaYSB8IPzVDyciwk9EHBIcda26QqkBPQQ5x1eqRlMz5i6+2dFUKoeO
 B7rHS3P
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Le 26/09/2022 à 23:40, Jason A. Donenfeld a écrit :
> On Mon, Sep 26, 2022 at 11:37 PM Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 26/09/2022 à 13:39, Jason A. Donenfeld a écrit :
>>> Various tools, such as kexec-tools and m68k-bootinfo, expect each
>>> bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
>>> padding to fill this out as such.
>>>
>>> Also, break apart the padding additions from the other field length
>>> additions, so that it's more clear why these magic numbers are being
>>> added, and comment them too.
>>>
>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Cc: Laurent Vivier <laurent@vivier.eu>
>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>> ---
>>>    hw/m68k/bootinfo.h | 10 ++++++----
>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>
>> Applied to my m68k-for-7.2 branch
> 
> What about 1/2?
> 

I'd like to wait a little to see what happens on the linux side.

Thanks,
Laurent
