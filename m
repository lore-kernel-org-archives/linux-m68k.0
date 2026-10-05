Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA62F480DFC
	for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Oct 2026 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204178; cv=none; b=A1pEOC8+UxNplOhgq0kesF+m3yvzNZ94tItjYUjDpbABI3vxMTn+blI9IRdPFuDqyBubFD9Weg0qxjyzRuP9VJJmkh863ehdJ9du7vssXtolDCxs3h9T6PyHA0vvd3BBQGt551WCUE9JXacxWdJCQQs+mTa9hQeA65+9UDBa7Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204178; c=relaxed/simple;
	bh=MeeF+CrxXpmhlixg9jiu/837NW9C8nofsMS1C8K2YpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/sAnmoQ7ZsEvZgfh+5eChQBzz5oTSZPHY/VuCU///3MLvGNmSd8IhkACumALhhtgMEYROmrD51BQHs9Yh7fpPxH4XyzVYqwhiUprtdvSkEaT+OA2HwVshXdO6ZeTjS7mO4Na/LAgUKscwt+qcfcul3PUdQqiOqjbIpKND6FkpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=polyxeno.com; spf=pass smtp.mailfrom=polyxeno.com; dkim=pass (2048-bit key) header.d=polyxeno.com header.i=@polyxeno.com header.b=BTpjst6t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=y91fhonA; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=polyxeno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=polyxeno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=polyxeno.com header.i=@polyxeno.com header.b="BTpjst6t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="y91fhonA"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id A2281EC08C7
	for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Oct 2026 08:42:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 05 Oct 2026 08:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polyxeno.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1791204173;
	 x=1791290573; bh=/r+VbIM658CiC0hWNXkDFMWJuEF2FkNsawZszh5+cTs=; b=
	BTpjst6tP3PTKNFtLmfkfatMqMOWmj3orwQZTTvY8Fb9BQMvYTishyCn+4zdDHXx
	i5PEmBtpX06sjap88bvtxr6rNki6DljQw1e/jWWAO47mmMEcvTK2Ja28xUL+VI5/
	FOuMWu0V6IyeCiLR8IXHp1q3Msf38mww19ZG9YrVQZopHB1+LkF0WYDR22iM7vF+
	2Bkz6bYz6YULBvGb1f62fF+jHfPHQoWHl76HxFNWgqczIZwWu6l0bKjG94S+J5uk
	AYF31CKqYjxDx5dK/YNIBw48kLhEdxZuQGkz4umCnbNCtD/mFoHYjLFXZI9+/8nH
	OpA+1jb6Cxipz87wTUtbRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791204173; x=
	1791290573; bh=/r+VbIM658CiC0hWNXkDFMWJuEF2FkNsawZszh5+cTs=; b=y
	91fhonArTNzuw/yaaN5ybjYgEhoq/MFi68y226hrMB4tG553C59lb0fTHbg+tDKs
	qlGfrZnP7FguXTOA+Gy/VbUG9VAKezyt7enULBVTo2WpqvO2qwVk+9kxnnTIOPjd
	BK7+HDA9gVkXATkvoPdkGxc/PZZWUKBd3EXPSfn410vMHxpeY2oEYYFe3j3JHv3g
	VzgNjl2vqFt2KxGFkPnlAaC6gCzvmgyJK2m/uFgGGv748gN/ku9A+5OPwL5LLtq7
	rUuowaBMLXALSfzNPSi+YO3/WbHNF6D0kSn1ILDPyskU/20Fx2OMbvhujVo9lkxK
	l5k4ykJvVQwjGAvCluvSw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=polyxeno.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791204173; d=polyxeno.com;
	mf=PGdlcmdAcG9seXhlbm8uY29tPg==;
	rt=PGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmc+;
	s=fm2:rsa-sha256:jIzqv3ZLuKDtvoE/svdspJt6ID5C/pheOBizFGCuW10lFxc
	1wEAgqr9/bfWF+q44mrFYbrP4RE6bi23hFhwa1Q24AYdEkf7a2uYTU0BphcD5fBq
	DRJ4HuorcU/sOnNAZQdd8d9V1IMl+MSMW/Zt8M1MwrSqYGsqV3bUatQLs0PW7gpA
	Y4WutxVlWFVrZhdzx/5XEvLlsenRmmnYFmDNptMWA+NfiMRUeH8j0t0Bg5ehSVxO
	kmCJGS2F93wuDczP41+ZgmKqW3IO5XfM9MuZkQsG8AnmbjsNE4OVEPs+/eOFhRs8
	SIH/WGfio88yil5T7dlgLMGE1hg/wFpm0y52hjA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:upo6ejqGADHgwgcDylnzrnqjKrzWLRgbPxDmK8ELjOE=:MeeF+CrxXpmhlixg9jiu/837NW9C8nofsMS1C8K2YpY=;
X-ME-Sender: <xms:TZvDamKO-zZkbUUGU9Y1SmwaWeUoLk1wTRjuNLwatinCBZYpSuzT2w>
    <xme:TZvDavrVAC9GqQ4dDNInzpmDG4wGbsl0XLRQ4rNEeao7CzLazmtXilICH775JmvhJ
    Y9OnuhAD2UMVeGBSoQeKFnIc3DIUJKN0u8u5-mnafa1jG_-b758k7A>
X-ME-Received: <xmr:TZvDamx0JwdHd9wY1OHVhxKf73DlauGG7Kwhbrff3UB8FaDiyT1AREZMekfOLQVJRwItnXs5BU34JNC4HkCSweAg5A>
X-ME-Proxy-Cause: dmFkZTGkdktSZ2XjHZVQ3qlR2/hzwrvg5W3AwpNBai5bB8qNSpci0/YIAXHGjX8ji6LMVL
    7WSqPYIdQqthOLpG9u3uVsbfPKC9rw8H4X+9PYFkyC1Vxag2Hi4ItG4H0tGd+EMpTMmt6W
    cnKjHmLHpjbztw6Q+8HC2HHFH+aNCuSAAU3698dmCYwG8mfEZl7RS8ptvZrYzDb5oV9ZvG
    WfPZ2qf12NUmXxSO962npqntMQ3RxK3K7ceqJeFhVxkn8T1IzHVUthcAXIaWkmDSBuAF2L
    p8u7gQugY5Gaon9lB4//2g0nd/xQoQyJnytQC1fez297YBb9FmE0jW1MlVj7m1mHK+9TCG
    aOy+MSZEaqZbr88kbtNiGx8xEfMxo1x496DGvB3g4cO6VK5rSTJtA6eoAFr82qlNSq+QxW
    Bkvd+QrQpyAEIa0nwIfyg3Q0jcRRcZozaGpadzZ0W33XJMTqZCljbTWWrepY6xmVYvVG1a
    tBFDS7+DvXx3DLK5s/aVwEgdov9T4JloJ+d4gp25Qih2Q2Qti1jSOoRYdINyAi3kdCsMMz
    vZphqmm8Xy/IASawFZu6thYvU7LvxftNCCrCn0Oz1MXANwOYirFWVaXRSx1nsrJoRoy1bM
    WYFoDY9fyz9PUtiW7BX98BG3v/LKVv+ugPP5m+0MsBuuujnzY7mI6YXBR74w
X-ME-Proxy: <xmx:TZvDarPz8X1SCyE8ALBhKSxVGCXzdJLN3_t-HEUtEY_4lDyjN-DOpg>
    <xmx:TZvDaj7dNDrfnTWWFK4m13-lVrdP50_hEvS9TOT6fDhX5jYbmQ7_XQ>
    <xmx:TZvDasko4feZLTP3bZznssT8ma0hiGV_eK3iD-3QrufAFk91LNWiAg>
    <xmx:TZvDakROkgVNZM5U6OLk6V2KyF9U0f8fKVzFi5REG5_rsbQAdJF2MQ>
    <xmx:TZvDaj52xmhCfJgtDYZia217w9a9kVVM8cyBfwOWAzwW5TObuRywwbnf>
Feedback-ID: i09fe4b60:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 08:42:50 -0400 (EDT)
Message-ID: <5bb9f586-6939-433e-9e06-a9bbc08a69a0@polyxeno.com>
Date: Mon, 5 Oct 2026 22:42:47 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] m68k: Handle put_user faults more carefully
To: Michael Schmitz <schmitzmic@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
 <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com>
 <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
 <dfcbbc59-4204-478b-b8da-867621056c62@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@polyxeno.com>
In-Reply-To: <dfcbbc59-4204-478b-b8da-867621056c62@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Michael,

On 3/10/26 09:55, Michael Schmitz wrote:
> Hi Geert,
> 
> On 03/10/2026 5:28 AM, Geert Uytterhoeven wrote:
> 
>> Hi Michael, Finn,
>>
>> On Thu, 1 Oct 2026 at 20:57, Michael Schmitz <schmitzmic@gmail.com> wrote:
>>> On 1/10/26 22:08, Finn Thain wrote:
>>>> Running 'stress-ng --sysbadaddr -1' on my MC68040 system immediately
>>>> produces an oops:
>>>>
>>>>       Unable to handle kernel access at virtual address f1c422fb
>>>>       Oops: 00000000
>>>>       Modules linked in:
>>>>       PC: [<00005a1a>] do_040writeback1+0xae/0x160
>>>>       SR: 2010  SP: 96087dc2  a2: 01500000
>>>>       d0: 00000000    d1: 014e8000    d2: 00000081    d3: 00000000
>>>>       d4: 00000481    d5: c043dfff    a0: 014e8000    a1: 00632fd5
>>>>       Process stress-ng (pid: 221, task=1b729d30)
>>>>       Frame format=7 eff addr=014e9eb8 ssw=0c81 faddr=c043dfff
>>>>       wb 1 stat/addr/data: 0001 00000481 c043dfff
>>>>       wb 2 stat/addr/data: 0081 c043dfff 2f746d70
>>>>       wb 3 stat/addr/data: 0005 014e9ed4 2f746d70
>>>>       push data: c043dfff 800daa70 00000000 014e9f1c
>>>>       Stack from 014e9ed4:
>>>>         2f740000 8017c000 014e9f10 00006830 00000081 c043dfff 2f746d70 2f746d70
>>>>         0081a000 00000400 c043dfff 800daa70 c043dfff 80016a20 00000003 014e9f88
>>>>         000026c8 014e9f1c 00000001 2f746d70 0081a000 00000400 c043dfff 0081afff
>>>>         c043dfff 01500000 00000001 ffffffff 00000000 20000046 41d67008 014e9f58
>>>>         04810005 00810045 c043dfff 014e9f84 2f746d70 c043dfff 2f746d70 c043dfff
>>>>         80016a20 8017c000 00000000 0081affb 00000005 014e9fc4 00128bc6 c043dfff
>>>>       Call Trace: [<00006830>] buserr_c+0x510/0x698
>>>>         [<000026c8>] buserr+0x20/0x28
>>>>         [<00128bc6>] sys_getcwd+0xc8/0x15a
>>>>         [<000027a2>] syscall+0x8/0xc
>>>>         [<0008800d>] sanity_check_segment_list+0x17/0x11e
>>>>
>>>>       Code: 000c 0e90 1800 220f 0281 ffff e000 2041 <2228> 0008 0281 00ff
>>>>             ff00 67a4 6026 4280 122e 0013 206e 000c 0e10 1800 220f 0281
>>>>
>>>> 0000596c <do_040writeback1>:
>>>>       596c:       4e56 fffc       linkw %fp,#-4
>>>>       5970:       2f02            movel %d2,%sp@-
>>>>       5972:       202e 0008       movel %fp@(8),%d0
>>>>       5976:       4282            clrl %d2
>>>>       5978:       3400            movew %d0,%d2
>>>>       597a:       220f            movel %sp,%d1
>>>>       597c:       0281 ffff e000  andil #-8192,%d1
>>>>       5982:       2041            moveal %d1,%a0
>>>>       5984:       2228 0008       movel %a0@(8),%d1
>>>>       5988:       0281 00ff ff00  andil #16776960,%d1
>>>>       598e:       6600 0104       bnew 5a94 <do_040writeback1+0x128>
>>>>       5992:       4e7b 2000       movec %d2,%sfc
>>>>       5996:       4e7b 2001       movec %d2,%dfc
>>>>       599a:       0240 0060       andiw #96,%d0
>>>>       599e:       0c40 0020       cmpiw #32,%d0
>>>>       59a2:       6700 0084       beqw 5a28 <do_040writeback1+0xbc>
>>>>       59a6:       0c40 0040       cmpiw #64,%d0
>>>>       59aa:       6730            beqs 59dc <do_040writeback1+0x70>
>>>>       59ac:       4a40            tstw %d0
>>>>       59ae:       6752            beqs 5a02 <do_040writeback1+0x96>
>>>>       59b0:       4280            clrl %d0
>>>>       59b2:       220f            movel %sp,%d1
>>>>       59b4:       0281 ffff e000  andil #-8192,%d1
>>>>       59ba:       2041            moveal %d1,%a0
>>>>       59bc:       2228 0008       movel %a0@(8),%d1
>>>>       59c0:       0281 00ff ff00  andil #16776960,%d1
>>>>       59c6:       6600 0086       bnew 5a4e <do_040writeback1+0xe2>
>>>>       59ca:       7201            moveq #1,%d1
>>>>       59cc:       4e7b 1000       movec %d1,%sfc
>>>>       59d0:       4e7b 1001       movec %d1,%dfc
>>>>       59d4:       242e fff8       movel %fp@(-8),%d2
>>>>       59d8:       4e5e            unlk %fp
>>>>       59da:       4e75            rts
>>>>       59dc:       4280            clrl %d0
>>>>       59de:       322e 0012       movew %fp@(18),%d1
>>>>       59e2:       206e 000c       moveal %fp@(12),%a0
>>>>       59e6:       0e50 1800       movesw %d1,%a0@
>>>>       59ea:       220f            movel %sp,%d1
>>>>       59ec:       0281 ffff e000  andil #-8192,%d1
>>>>       59f2:       2041            moveal %d1,%a0
>>>>       59f4:       2228 0008       movel %a0@(8),%d1
>>>>       59f8:       0281 00ff ff00  andil #16776960,%d1
>>>>       59fe:       67ca            beqs 59ca <do_040writeback1+0x5e>
>>>>       5a00:       604c            bras 5a4e <do_040writeback1+0xe2>
>>>>       5a02:       4280            clrl %d0
>>>>       5a04:       222e 0010       movel %fp@(16),%d1
>>>>       5a08:       206e 000c       moveal %fp@(12),%a0
>>>>       5a0c:       0e90 1800       movesl %d1,%a0@
>>>>       5a10:       220f            movel %sp,%d1
>>>>       5a12:       0281 ffff e000  andil #-8192,%d1
>>>>       5a18:       2041            moveal %d1,%a0
>>>>       5a1a:       2228 0008       movel %a0@(8),%d1
>>>>       5a1e:       0281 00ff ff00  andil #16776960,%d1
>>>>       5a24:       67a4            beqs 59ca <do_040writeback1+0x5e>
>>>>       5a26:       6026            bras 5a4e <do_040writeback1+0xe2>
>>>>       ...
>>>>
>>>> The cause is a deliberately misaligned access in the 'bad_end_addr' test
>>>> case in the 'sysbadaddr' stressor. The location being accessed here,
>>>> 0xc043dfff, was contrived to span the boundary between a r/w anonymous page
>>>> and an unmapped page. The address was then passed to the getcwd syscall
>>>> which faulted in copy_to_user().
>>>>
>>>> The fault for the mapped page appears to be handled okay -- up until
>>>> do_040writeback1() called put_user() which produced a second fault due to
>>>> the unmapped page.
>>>>
>>>> Michael Schmitz helpfully deciphered the oops and explained the exception
>>>> processing leading up to it.
>>>>
>>>>       "regs->pc does point to the PC in the format 7 frame which is the PC
>>>>       the fault was detected at, but not (in case of a writeback fault)
>>>>       the PC of the faulting instruction [that is, MOVES.L].
>>>>
>>>>       "The writeback would still cross the page boundary, and fault if the
>>>>       unmapped page still isn't present. We would not see the PC of the
>>>>       movesl in that case, and fail to find the PC in the exception
>>>>       table."
>>>>
>>>> One solution is to add a NOP instruction after the MOVES.L to flush the
>>>> pipeline and take the fault. That way, the PC value in the exception frame
>>>> becomes dependable so the exception table works.
>>>>
>>>> Theoretically, there seems to be another bug in the existing code. If
>>>> the instruction following the MOVES faulted, then after the fixup,
>>>> execution would resume at the instruction which caused the fault. This
>>>> appears to be a loop. After this patch, that cannot happen.
>>>>
>>>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>>> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
>>>> ---
>>>>    arch/m68k/include/asm/uaccess.h | 10 ++++++----
>>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
>>>> index 31d133faa45e..728a6dfb7414 100644
>>>> --- a/arch/m68k/include/asm/uaccess.h
>>>> +++ b/arch/m68k/include/asm/uaccess.h
>>>> @@ -31,11 +31,12 @@
>>>>    #define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
>>>>    asm volatile ("\n"                                  \
>>>>        "1:     "inst"."#bwl"   %2,%1\n"                \
>>>> -     "2:\n"                                          \
>>>> +     "2:     nop\n"                                  \
>>>> +     "3:\n"                                          \
>>>>        "       .section .fixup,\"ax\"\n"               \
>>>>        "       .even\n"                                \
>>>>        "10:    moveq.l %3,%0\n"                        \
>>>> -     "       jra 2b\n"                               \
>>>> +     "       jra 3b\n"                               \
>>>>        "       .previous\n"                            \
>>>>        "\n"                                            \
>>>>        "       .section __ex_table,\"a\"\n"            \
>>>> @@ -53,11 +54,12 @@ do {                                                              \
>>>>        asm volatile ("\n"                                      \
>>>>                "1:     "inst".l %2,(%1)+\n"                    \
>>>>                "2:     "inst".l %R2,(%1)\n"                    \
>>>> -             "3:\n"                                          \
>>>> +             "3:     nop\n"                                  \
>>>> +             "4:\n"                                          \
>>>>                "       .section .fixup,\"ax\"\n"               \
>>>>                "       .even\n"                                \
>>>>                "10:    movel %3,%0\n"                          \
>>>> -             "       jra 3b\n"                               \
>>>> +             "       jra 4b\n"                               \
>>>>                "       .previous\n"                            \
>>>>                "\n"                                            \
>>>>                "       .section __ex_table,\"a\"\n"            \
>>>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>>>>
>>>> in case it helps.
>>>>
>>>> Anecdotally, I've seen similar uaccess faults causing kernel oops on 030
>>>> as well, so this may not merely be an artificial unaligned access issue.
>> Shouldn't this include
>> https://lore.kernel.org/20240429030945.22451-3-schmitzmic@gmail.com
>> ?
> 
> Along with https://lore.kernel.org/20240429030945.22451-2-schmitzmic@gmail.com, perhaps.
> 
> Can't recall the details, but Finn's solution was to add a nop in order to make the fault PC reliable. That's not a great deal of overhead in the case of put_user(). My changes to copy_to_user try to avoid flushing the pipeline inside of a loop, and only use the nop after exiting the loop. The cost of that is larger exception tables. Not sure which is worse.
> 
> What's more, I can't be certain that my 'fault is taken two instructions past faulting instruction' observation is 100% reliable. AFAIK this has only been tested on 030 and 040. Coldfire(MMU) and 060 tests are still missing.

ColdFire seems to have more, or maybe just different problems for "stress-ng --sysbadaddr -1".
Running a kernel with and without this patch resulted in:

# stress-ng --sysbadaddr -1process '/usr/bin/stress-ng' started with executable stack
stress-ng: info:  [40] defaulting to a 86400 second (1 day, 0.00 secs) run per stressor
stress-ng: info:  [40] dispatching hogs: 1 sysbadaddr
*** ILLEGAL INSTRUCTION ***   FORMAT=4
Current process id is 250
BAD KERNEL TRAP: 00000000
Modules linked in:
PC: [<00000000>] 0x0
SR: 2004  SP: 013da6cc  a2: bfccd950
d0: 00000000    d1: 00000002    d2: bfccd814    d3: 00000001
d4: 80174c1e    d5: 800bd9ac    a0: 800bd9ac    a1: 800bdb54
Process stress-ng-sysba (pid: 250, task=f7e050bd)
Frame format=4 eff addr=44090004 pc=80115870
Stack from 013ea000:
Call Trace:
Code: 0000 0000 0000 0000 0000 0000 0000 0000 <0000> 0000 0000 0000 0000 0000 0000 0000 0002 a6c4 0002 a6c4 0002 a6c4 0002 a6c4
Disabling lock debugging due to kernel taint
note: stress-ng-sysba[250] exited with irqs disabled
*** ILLEGAL INSTRUCTION ***   FORMAT=4
Current process id is 42
BAD KERNEL TRAP: 00000000
Modules linked in:
PC: [<00000000>] 0x0
SR: 2004  SP: affae50f  a2: 012d1f80
d0: 00000000    d1: 0000000b    d2: 01057db0    d3: 00035b9a
d4: 00000000    d5: bfccd814    a0: bfccd814    a1: 0050c21c
Process stress-ng-sysba (pid: 42, task=1b5bfafe)
Frame format=4 eff addr=480a2004 pc=00035ab2
Stack from 013d3f28:
        00000000 000000fa 00000000 00000004 01057db0 00000000 0000000b 00000000
        00000000 012d1f80 000336b4 00000100 00000122 fffffff6 bfccd76c 00035c1c
        000000fa bfccd814 00000000 00000000 bfccd76c 00000000 0000000a 000000fa
        00000000 8011685e 80119990 00935414 0002ce18 013d3fcc 00000000 00000000
        00000000 00000000 8011685e 013d3fcc 00000005 bfccd7a0 80010686 0002a6bc
        0002df3c 000000fa bfccd814 00000000 00000000 bfccd814 00000000 800bdb54
Call Trace: [<000336b4>] child_wait_callback+0x0/0x86
 [<00035c1c>] sys_wait4+0x82/0x92
 [<0002ce18>] buserr_c+0x130/0x1dc
 [<0002a6bc>] buserr+0x28/0x30
 [<0002df3c>] system_call+0x58/0xac


I have not debugged any further yet.

Regards
Greg


