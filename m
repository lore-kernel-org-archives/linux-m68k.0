Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703A3C433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Apr 2022 23:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbiDDXgb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 19:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbiDDXga (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 19:36:30 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB87213FA7
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 16:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649115270; x=1680651270;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+5MMmPyU6ZJJ0lTiy81U+nJ/FsY36S456cHlcxHKPSc=;
  b=mJWyRjYFbc/VyZM6MyYXc9lGHn9T1eSwjcf6CeCcrJSet+b6+rI5TdYl
   0viSP3sPTKOyep4m+yMLPZHt4CIigzvtXwl2C3shtDYafyKAwMM1OKy/+
   yBc+idoXOqrZ5pCCwTIBxah5RGGnkR5DpVNwMo1WWNBApk2WuaEaZLxmW
   yY30Xh0xznYS6/U6oD951M+fiE5kRWVREr54jVvccqNxP5jJkNhgNfBXp
   Quli4W+N/hJ2YVujJTNGdUEOQvc6hULwHxUz9bwAmMvdRmhhC4rHTiHws
   U8qeEbQ3kBMZ0Rlj3PEdRY3EblId11G/g76rYMtmUies8FGlh2y8Ac3oG
   g==;
X-IronPort-AV: E=Sophos;i="5.90,235,1643644800"; 
   d="scan'208";a="195955916"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2022 07:34:29 +0800
IronPort-SDR: Bhc65ljymq9snCJzCB21r8prSyhubyuCXykSgtKraxp7OYt/J6oCpQ0P/1cCap3j7Cg5oGKZCv
 LTr63If5RLhlqb02GQUfqEdRQRYf66t7ED+V1Ss4vfBL+KGBx0AgxTMs+ClzAlx7XVsXgKag+O
 1TCcWl8rwdoltsWrrDBnZo443DFnE3k4aDZqIiDwNnJ5w7ohhv0Bd6rLZYZa0stnaDnt4Kzlb6
 H3efnW6z5iQxzlYmgQNFHVypLma/3vaHR5ER777Zh5PeUyw62brAcLwq08rsTzg7wf2dAM81yH
 5VbpWFlb6imd/BnzBvvcSMVi
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Apr 2022 16:05:09 -0700
IronPort-SDR: P0PDpjPftysbVMczAmtUlEoaRzaNIqhlRQFBsAn/2pKRzFE9HsGmVOjP/bmlAdIUNYJTr15S0O
 CWKcOCQECHtT8UB53CRdeH/FJedTctk/8915pILAIBPYUt4uBZPPXQIQA75erujQBRUre6UKkA
 6NBFx/R/agWOmSi121+LDEkzQ7iXuqEVrkIU/z0acjtpLKDslBUE0sLmUIp7jpQGyy8VcnTM5s
 HCgyWohcjbC58a/WnTXTOl8uvmE8OkgDwRBx9mYOT9nNPB+0TBPg77hoi9Bn1C3zfyeu8Xl46h
 seY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Apr 2022 16:34:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KXRv55MjHz1SVp5
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 16:34:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1649115264; x=1651707265; bh=+5MMmPyU6ZJJ0lTiy81U+nJ/FsY36S456cH
        lcxHKPSc=; b=NmXGSpihtKJypsJDwlOSBugs5bzoYpMuuBDgh/oBqIn+/Eb8mMq
        lI6D/MptbIBjXUVDl/UMgUaRdw4yZZvwum/7IJjbVyOrmgTT+k/7Pf/TIW2Szu6k
        gc7mfbb8PoLSzmV7Wh2r1w3TskdGFURxSc8XADmTZENiyab6u+3Ep2eTIOdqdSF6
        NWkS2OD25F1vSAjy1UWzi5Cy3L1OuNi1q6ge7xGAumKL2x02HwBUCiLi9eXMfRNm
        SiZfFUOR8TizSU1svfJKmtFfvy1CHmvgomNA5aLGazPZojpQLhdHYFwFf34/zQHz
        XYUG2Wmpho9kURuveUVhewHi9fGM2cECXOw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Ewt_grj3tMep for <linux-m68k@lists.linux-m68k.org>;
        Mon,  4 Apr 2022 16:34:24 -0700 (PDT)
Received: from [10.225.163.2] (unknown [10.225.163.2])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KXRv20dN1z1Rvlx;
        Mon,  4 Apr 2022 16:34:21 -0700 (PDT)
Message-ID: <5245096f-6003-39a9-6e5e-db2fc4f567fd@opensource.wdc.com>
Date:   Tue, 5 Apr 2022 08:34:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Max Filippov <jcmvbkbc@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rich Felker <dalias@libc.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/4/22 22:22, Geert Uytterhoeven wrote:
> Hi Arnd,
> 
> On Mon, Apr 4, 2022 at 3:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> On Sun, Apr 3, 2022 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
>>> On Tue, Mar 08, 2022 at 09:19:16AM +0100, Arnd Bergmann wrote:
>>>> If there are no other objections, I'll just queue this up for 5.18 in
>>>> the asm-generic
>>>> tree along with the nds32 removal.
>>>
>>> So it is the last day of te merge window and arch/h8300 is till there.
>>> And checking nw the removal has also not made it to linux-next.  Looks
>>> like it is so stale that even the removal gets ignored :(
>>
>> I was really hoping that someone else would at least comment.
> 
> Doh, I hadn't seen this patch before ;-)
> Nevertheless, I do not have access to H8/300 hardware.
> 
>> 3. arch/sh j2 support was added in 2016 and doesn't see a lot of
>> changes, but I think
>>     Rich still cares about it and wants to add J32 support (with MMU)
>> in the future
> 
> Yep, when the SH4 patents will have expired.
> I believe that's planned for 2016 (Islamic calendar? ;-)
> 
> BTW, the unresponsiveness of the SH maintainers is also annoying.
> Patches are sent to the list (sometimes multiple people are solving
> the same recurring issue), but ignored.
> 
> Anyway, I do regular boot tests on SH4.
> 
>> 5. K210 was added in 2020. I assume you still want to keep it.
> 
> FTR, I do regular boot tests on K210.

FYI, we identified the problem that makes userspace execution unreliable.
Working on a fix.


-- 
Damien Le Moal
Western Digital Research
