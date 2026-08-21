Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD643F1662
	for <linux-m68k@vger.kernel.org>; Fri, 21 Aug 2026 06:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294656; cv=none; b=LWy+YDCF/3Dv+KfmHcRWi3vapOWfoy/3+6IxmrZ6lN3jhcd6Bb8xTdSskyB/2CkQdEkjvOIi4rnA5H7v1hxQZACLuzw4i1AK2sD3QAAo9GcgEBuDc3MCP7qnnJDpCdrZJ8rAvZqCelxEcxPEXkyxPoLdS10Om5rJOBzLDjL+NGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294656; c=relaxed/simple;
	bh=L/UVVSeom+P59+ujN47bnKq68spw15q+i+jnk4n4Pzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5i4hr1mTsgIaUmwMQQY9LfWzLiuYfbVoYI59vNXhAEMsMy+ZpZcATujPRwZxtMyA3ngWivEExgf82lKcuFnOzR08gbaXSLH9U0rxDYqmvBLbgcWitlMLbhpco9x+4+eeE8uccshukKv2SMiY0VrhigAYaZnYNCTxVsNYF6i9Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5Yzpfy1; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5Yzpfy1"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848643382fcso601222b3a.1
        for <linux-m68k@vger.kernel.org>; Thu, 20 Aug 2026 23:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787294654; x=1787899454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S3NXjAx8DS81zlRBp1anbXWy3b9niKSDmBNBcwUXn1I=;
        b=Z5Yzpfy1fJyt+TvL0aToBx87Fg7V80xpjGfPuNfdpqIz4rNLHBTgDkB1s9A3txY+SI
         u9HQ4dz15vmJOwnVQs4tl0AvHNtyZh4ESA1MDq7ZnJZG+QT4BuCzoT08/ZRuIk6M0sbE
         F/sUgdBbMKX1GXGqPsgip08muVmIO7HNY1a4kj+4ZgnftJt3RnmEDjfN6MOCN4mlZfye
         sS2A3iD2You8scuiP94LXun5+GR507WpBliDb1yGuKBcFwcOUgYA2hDZpWyjZKqkyvWC
         sVL347zemQw2fEKkqImLXhfmQR5Ghy/IdS0oG977v6am98s8RkGFfl0ioeAw155tMjet
         orqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294654; x=1787899454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3NXjAx8DS81zlRBp1anbXWy3b9niKSDmBNBcwUXn1I=;
        b=sDV6EPDjoWC6eZwZ90Svd8NJkgoiuu3RknMy5CGovfPOPIa9E5EZwampCGxfoVO/fT
         diITiCIKuZ5qM2PPS0aUqcXwiTs/EuXzSzFm38Q5fZx83KT8gc1/wX3Em8cfGM5YOrLh
         TTAk2SiyiOYVEh6l5Lc4j2sELSgN3fpjrUzmBPlgB7FAWeKtHiNIxpemuQDysBmzRBJc
         BAlrPF33J08JkVu4jcBcLBybYvz9xpILSIbfa7c+BtMoYQwjeFDk1sf08YjttoYL5sNh
         0sDvDWSvCMA0Nd1kIAwmb6u2HOBpZrdETZwsZZz1INsu6ccoQV0a4V8QxcxhKtai7Igl
         u4pw==
X-Forwarded-Encrypted: i=1; AHgh+RrkgjME27W2PLYUsM+ywseDLUbHmWwpaukE8RRHhd53b3mXYoAdswRlIYiTAHnovhg+Xe9nVylF2A9Z@vger.kernel.org
X-Gm-Message-State: AFuF++mPhvgbSK7Zm3ohc/svtoCOEw4hfH9z/xTeTo7E2h9drBlgxEF5
	iNp7wGcCLNHh1uSS0iB4mvFOrwPw25ZcI64MdwekRxkWz1YONUxbFQCB
X-Gm-Gg: AR+sD10yctuTj48iFGwCKnlR3kCtFZajiPbT8rM9LXe+mQdAIBbAgWdf3mNE2dKempA
	8I2GoyS3oPIV8YkGhUB6KZE3+dC2hogXA0PyTA8P0Q4tGDmIKxOpgmjyZ2nLjT8cFlqf2o+oG9O
	KfhHfsxPcoOtlk6uGozBehe1cSTtBOMPUhToT0DgZJciYIzwfD7a1WZS2v75DUBfWBOkmYXmILL
	yNC/Dq666f2FYlymz8hkVbMD5UZTQmBVEGM2IeCI/ww+o4s2YaPUwhjZYqcX5pJb3ALyNQ9c+cU
	A1yV+XFZItDYVq9y66RUbjzngKEJLm/oPuix2Ns0+05Uf/ldYte98uq2OEoAtOUZ3Lx+Pg93b8o
	N3hD/f8Z61dCIook14oDBXNdEGkpCJfnwGaRX59K2mYC7LQtQk4u+SsfZLwXwwz6URi6cw5ln1y
	DHrNhBvI+Mg41TcI2wvErcOT3JKWrvAfUahxMvmK+fEDM+ddpAVjm+OSPqJgL6xOKPSGG/gBHU9
	nxgpJjY1nv9JQ+tnOUsBCCwV+6i3yz1lvxIpQ==
X-Received: by 2002:a05:6a00:39a4:b0:851:804c:f4eb with SMTP id d2e1a72fcca58-851f9a4b174mr5908647b3a.4.1787294654092;
        Thu, 20 Aug 2026 23:44:14 -0700 (PDT)
Received: from [10.1.1.100] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d366f028sm2470992b3a.53.2026.08.20.23.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 23:44:13 -0700 (PDT)
Message-ID: <b9883e21-3ce7-4d0c-aa11-53d8d6d78e60@gmail.com>
Date: Fri, 21 Aug 2026 18:44:08 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] fbdev: Give atafb proper parent
To: Helge Deller <deller@gmx.de>, linux-m68k@vger.kernel.org,
 geert@linux-m68k.org
Cc: Miro Kropacek <miro.kropacek@gmail.com>, linux-fbdev@vger.kernel.org
References: <20260819222838.21256-1-schmitzmic@gmail.com>
 <20260819222838.21256-3-schmitzmic@gmail.com>
 <aa508c70-ccd3-4fc0-86fc-e45746e68405@gmx.de>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <aa508c70-ccd3-4fc0-86fc-e45746e68405@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Helge,

On 21/08/2026 9:51 AM, Helge Deller wrote:
> On 8/20/26 00:28, Michael Schmitz wrote:
>> From: Miro Kropacek <miro.kropacek@gmail.com>
>>
>> The atafb fb device registers no parent, causing a missing symlink
>> (/sys/class/graphics/fb0/device). Xorg fbdevhw driver looks for that
>> symlink when scanning for devices, so add a parent node for atafb.
>>
>> The proper way to do that is use of framebuffer_alloc(), which
>> requries refactoring atafb to move from static fb_info to allocation
>> of fb_info by framebuffer_alloc().
>> About the only location where a fb_info pointer cannot be passed
>> is monspec setup in atafb_setup(). Store static monspecs there
>> and copy into place after framebuffer_alloc().
>>
>> Pass fb_info everywhere it's needed (detect, decode_var and
>> do_fb_set_var functions), and remove the static fb_info struct.
>>
>> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>> Cc: <linux-fbdev@vger.kernel.org>
>> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
>>
>> ---
>>
>> Changes in v3:
>>
>> - fbdev: refactor atafb fb_info use to allow use of framebuffer_alloc()
>>    (Thomas Zimmermann)
>> ---
>>   drivers/video/fbdev/atafb.c | 174 +++++++++++++++++++-----------------
>>   1 file changed, 92 insertions(+), 82 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
>> index b8ed1c537293..a9be06ded5c9 100644
>> --- a/drivers/video/fbdev/atafb.c
>> +++ b/drivers/video/fbdev/atafb.c
>> @@ -158,14 +158,6 @@ static int DontCalcRes = 0;
>>   #define VMO_PREMASK        0x0c
>>   #endif
>>   -static struct fb_info fb_info = {
>> -    .fix = {
>> -        .id    = "Atari ",
>> -        .visual    = FB_VISUAL_PSEUDOCOLOR,
>> -        .accel    = FB_ACCEL_NONE,
>> -    }
>> -};
>> -
>>   static void *screen_base;    /* base address of screen */
>>   static unsigned long phys_screen_base;    /* (only for Overscan) */
>>   @@ -175,6 +167,12 @@ static int current_par_valid;
>>     static int mono_moni;
>>   +/* monspecs passed by user */
>> +
>> +static __u32 mcap_hmin;        /* hfreq lower limit (Hz) */
>> +static __u32 mcap_hmax;        /* hfreq upper limit (Hz) */
>> +static __u16 mcap_vmin;        /* vfreq lower limit (Hz) */
>> +static __u16 mcap_vmax;        /* vfreq upper limit (Hz) */
>>     #ifdef ATAFB_EXT
>>   @@ -299,7 +297,7 @@ static int *MV300_reg = MV300_reg_8bit;
>>   /* ++roman: This structure abstracts from the underlying hardware 
>> (ST(e),
>>    * TT, or Falcon.
>>    *
>> - * int (*detect)(void)
>> + * int (*detect)(*fb_info)
>
> I fixed this comment up to become:
> + * int (*detect)(struct fb_info *info)
>
> Other than that I've replaced the latest patch series by this series in
> the fbdev for-next git tree.

Appreciate the fast work - I'm working on another patch for atafb to 
update error handling in atafb_probe() (just calling panic() when 
something goes wrong is a little rough these days). Will take a little 
longer to test though.

Cheers,

     Michael

>
> Thanks!
> Helge
