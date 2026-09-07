Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F013ECBE5
	for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Sep 2026 20:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812315; cv=none; b=BAsEjejKaiLjIW8wx3xe4Xm10LIXWIeD36SBn/fdi52TitzR5P165DVQakUiHKr9mSBVTD3EQK9phEwSW3eUw1Oks4QqSQf3j33f8fmk965KC/dTcGhRp9yotWk0jeiuWwv0CPbzI4NesHN0yrout/RpR6cpH0OjuP+xMMAaFl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812315; c=relaxed/simple;
	bh=GP4LFAA+FEgEVuj9LBZm57dq1DGvQZhZyu8+UTZXZbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9gt5HdJNAU4Dpb1U8gjGeePojIDxkUoZZyytS9CaGc9NghVCIbWljroCPF1L7t0pqPvKoCwkB7P+AH4UR5lTn111Jo2TPnugbGn/hr0plrh3oL1FI3IBA4QgLM7tGtIoxSRT9gk3fKvSjGAzEt3QrCiUvP6yM2njbnBwWka5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc9yTbEV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc9yTbEV"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3683596a12.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2026 13:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788812313; x=1789417113; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkTk6U8Hsd5NK/nm/H/rlcc7sKnrtC8ko7vuxkMvp9s=;
        b=Dc9yTbEVod4r6I6sLD4pGYr8FCqBV3a1Gv4JRManCMdhUfjb4j8eCsqLWdwQTJbQO0
         qp624w2zGjC1IimQvcO1CoIFtrRJuBUextj68wxCYBOG6b1gkGTT6/JArBEXgYG6HII9
         ehmdTiKEG0hOW3TGi0o0VXVRs7Hm86k3tqVlO5ceHihldLeGU2PtQyddY1uFcPhV1Vjr
         wbXSvfE/Q20Meg08Laq5ea/77g8KUSQ2GDvyUYfu6Y9dzaYpVQvot+ZWyekrizqvFRjI
         YiS/4PMF6CE5Mf3RzEQrAc9eJlrS3xkSyqJQY2TYxiMHEqWNfC6QuhyOJAkBidxV5uSd
         4Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812313; x=1789417113;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkTk6U8Hsd5NK/nm/H/rlcc7sKnrtC8ko7vuxkMvp9s=;
        b=XNMhoh6T26b9nhJTzbrfGZa+x2QdOwUQRWa/pYENuCK0VG7BehskDumxxJ7maq97xG
         bJoxosE7EBFU9ZYyw5/6gDHKltzpGsAV0dNBzupMXkzMdoka68qdRDs175v1MEZJLN76
         ovdTH8+5tYo1gdcS1C8MK4tWLEH2Q6+YUUj7LJ+yXqhHSoJuzCe3PDf8od+fec1kqFEs
         NUAK1jwdsUdWLHw1YRcUysncg9Ei7Zqoc9Rqyj/NqxkBa71mZyRqBDCYTvOeCbAlfFxW
         2HGHN1H66BOUIXMO9IN07PRThv8GWotY6ZZKdEW7mb9zzaS/VWdmTw4/UkilNDTYM4B9
         ipbg==
X-Forwarded-Encrypted: i=1; AKwUvBxlmS90gwBe8MW0UJW5YqmCC9OXcgsCOR7ONvJsBowRWCcjU8DY30Y4GzI803M+O6857VV5I+laXjC5@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mivZwOY4cSCKh5WWBTBXJ4ch9esFFNLvONArDnTFoI9gAVvKks
	TXacKRysT5MbEjyqySzaip3z2wvGF2pc3c6JGMH98wnSQpIVa4zyga6o
X-Gm-Gg: AYBFou3xt/03ryydt2AV7MG2iliGUVxjZAealKTifvjgMzLbcFe3GNSV4nOH9rg9U+6
	pqDfWc092mNkTsENgeGwymx/slVrZHOilZzllksrZzNKD40PgW+LP5+g2CXC0cl9uj6461LvuzC
	4xJzYM2fM9ZiadQh3NPKsZ3nemZ2IV2vjAFwVC7v1GWNidoeWesqJL0jiDOqg/cIM5D8GY6sfhH
	UgjX1GzYxrEzUBFcrXRuji1EiSqnBhwVdtck/FFQMqcD+n3PJnkSKaCoDzfkqefzDCUMksOJlMS
	uzuBee8zD59wakAWCew+qTPnPze87LpdYf+GinwAolmhr0RWlOmLsa0otqX2xFHN6EHxjMjX6A8
	By5RIU+lt52ndH5b/2fKRYrIGVQ/JCZw2ql3Zg15hPAMVThAXXg9MjT0DH8aBbwGfLVLkcPOCrt
	nGG7jTkIHQN5kP4qnKFGvS6EwavB3xkWLtZRwd8g1Qk8I6CafBRc9rmxOJ7w5vufWbpWu7Na0IA
	p6C2xTYoxFsEweNtHk8TJ6mddpP7fDmi4xKYfj9Umqs+s476hrzhT1t8kCts/gfuVq4GLg2/ts+
X-Received: by 2002:a05:6a20:7350:b0:3d3:aec2:4dc8 with SMTP id adf61e73a8af0-3da3a0c510dmr36997103637.20.1788812313022;
        Mon, 07 Sep 2026 13:18:33 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:e5ea:1a30:7c29:cd76? ([2001:df0:0:200c:e5ea:1a30:7c29:cd76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338778fb926sm4986048eec.31.2026.09.07.13.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 13:18:32 -0700 (PDT)
Message-ID: <93ffe3ec-bb45-4c10-8d78-0cd23c9bb61e@gmail.com>
Date: Tue, 8 Sep 2026 08:18:25 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linmao Li <lilinmao@kylinos.cn>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, miro.kropacek@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20260827093948.2825531-1-lilinmao@kylinos.cn>
 <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
 <CAMuHMdVOc-_hgWvu84EW7tyQx6WzPtabnBUJ1T0uoxa1QZA94Q@mail.gmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVOc-_hgWvu84EW7tyQx6WzPtabnBUJ1T0uoxa1QZA94Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 7/09/26 20:38, Geert Uytterhoeven wrote:
> Hi Michael,
>
> CC linux-m68k
>
> On Sun, 6 Sept 2026 at 03:49, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 27.08.2026 um 21:39 schrieb Linmao Li:
>>> The SuperBlitter operations derive an integer byte count per pixel.  The
>>> accelerated fill path handles only one-, two- and four-byte pixels.
>>> However, the operations are currently installed for every external
>>> framebuffer in SuperVidel RAM, including planar 1/2/4/8-bpp and 24-bpp
>>> truecolor modes accepted by the external video parser.
>>>
>>> For 1/2/4-bpp modes, the byte count becomes zero, so accelerated copies do
>>> nothing and fills fall through to 32-bit stores.  Planar 8-bpp uses an
>>> incompatible memory layout.  For 24-bpp modes, fills also use 32-bit stores
>>> despite advancing addresses by three bytes per pixel.  These cases can
>>> corrupt the framebuffer beyond the requested rectangle.
>> I believe 24 bpp mode can be rescued using something like this (entirely
>> untested):
>>
>> --- a/drivers/video/fbdev/atafb.c
>> +++ b/drivers/video/fbdev/atafb.c
>> @@ -2463,6 +2463,11 @@ static void svblit_fillrect(struct fb_info *info,
>>           case 2:
>>                   memset16((u16 *)line, pix, rect->width);
>>                   break;
>> +       case 3:
>> +               memset(line, pix, ((rect->width * bytespp) % 4));
>> +               line += ((rect->width * bytespp) % 4);
>> +               memset32((u32 *)line, pix, (rect->width * bytespp) / 4);
> This uses unaligned writes for the largest part.
> You can avoid that by doing the memset32() first.

True enough (iff line happens to be aligned, which is only true if 
rect->dx is even).

But as Miro pointed out, 24 bpp can't actually be used (and without TOS 
setting such a mode before Linux boot, it can't ever happen).

Cheers,

     Michael


>
>> +               break;
>>           default:
>>                   memset32((u32 *)line, pix, rect->width);
>>                   break;
>>
>> Can't test this on hardware, and would need Miro to confirm it works as
>> intended.
>>
>>> Enable the SuperBlitter operations only for the layouts they implement:
>>> 8-bpp packed pixels and 16/32-bpp truecolor.  Keep the existing software
>>> operations for all other external formats.
>>>
>>> Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's SuperBlitter")
>>> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
>>> ---
>>>   drivers/video/fbdev/atafb.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
>>> index 5bca34c45cef3..c3011b61a94b9 100644
>>> --- a/drivers/video/fbdev/atafb.c
>>> +++ b/drivers/video/fbdev/atafb.c
>>> @@ -3360,7 +3360,11 @@ static int __init atafb_probe(struct platform_device *pdev)
>>>                memset (screen_base, 0, external_len);
>>>
>>>                /* framebuffer in SV RAM: enable the SuperBlitter */
>>> -             if (external_addr >= 0xa0000000) {
>>> +             if (external_addr >= 0xa0000000 &&
>>> +                 ((external_pmode == FB_TYPE_PACKED_PIXELS &&
>>> +                   external_depth == 8) ||
>>> +                  (external_pmode == -1 &&
>>> +                   (external_depth == 16 || external_depth == 32)))) {
>>>                        svblit_regs = ioremap(SVBLIT_REGS_PHYS, 0x100);
>>>                        if (svblit_regs) {
>>>                                svblit_fw = svblit_rd(SVBLIT_VERSION) & 0x1ff;
>>>
>> Otherwise, LGTM.
>>
>> @Geert: can you remember if pixel format or bit depth of an external
>> framebuffer can be changed at runtime using fbset??
> I am no Atari expert, but IIRC all external framebuffers rely on
> being fully set-up before Linux boots?
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
