Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C811745BF9
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716125219; cv=none; b=attNi9h6MA9STmNCv9wM+Fp6hcwSX2q+txBEodWKSoCLoBMhRH225sZFEKiDSEivWuAP40Oxued/A/340mHyQfhDYEkhJgj1lLXIEoMqZnZeYPElSzUHDOkpvNl9Gi9C8n1sH9rTNlTMWA0I2ieV+7ILBe8DTXJOmRblRFrGu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716125219; c=relaxed/simple;
	bh=NcB7N8F+vQEIhZKvLpJfHlJYR6ecGK/zxvVcbDDYqqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvpKpJPS4B+OTAmWT323EFHvgWvgz/OoYa32zR0v2nr7rs2TZ/qsui33Uhk4VQFNK4d4LnQgcAVABEiGiwBlv629zTHCXwTxmaXQYyI9XHopBYpfJ/KefI8xoKtqn+Ne07jy4k/h2+hGBZ9kUdqOo7h5VNnTs1y5b8EngZaSVEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKLALyqu; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKLALyqu"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a599a298990so680833966b.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716125216; x=1716730016; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3qQmbSq3iodjxZ2uM56jJDybuokVN8MR28N//rrs+I=;
        b=iKLALyquz3hL6qH1WZoWErriUnYR2Io2IjqwET4cG5MYPKp7ptCZ/mnQ4ua7KSCk7J
         D98jxuPHvLUrP3+eBM6duVp9CHAovP9D0wnw5kw6/GK1YdZ9FKsU7JvKSSsyF528Ux71
         N3WIAdHZJfQ6eqqAyr+XOAfFcvpcGgcQeQ9VajG5VVbytZaiUtlBLst5ehYBY/sFOvnD
         DUrT3o583FqLuRbPJunNH8yYlnLpQI7Ogq5G1ohcDPWI5pin2XpBmEgvOI2LWyDPwBP7
         fJqGVMQ9SaTeBRnQDFAqnQR/NWYaVZcrcom1PP4jxQtqq3vG29pLxZ3IxbmoRhOvUaxY
         lvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716125216; x=1716730016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3qQmbSq3iodjxZ2uM56jJDybuokVN8MR28N//rrs+I=;
        b=fZG6lNs3PxcvXTW+09f+a8HVxFHX6urd7snvj+AMVzEiMuILB14e8aTZ3wvmsmqVXp
         gJFZ0lyBgUGcRDbf8gmGOOpQ8P9P7dLX7MfOf8vb7L05Dp7eEAXSahMPVDGMqYw/896t
         yTLnd59VfmJ8bZPHziuSa9oeBaUtf9xf72NobJ0eauz//A1sgbuGGBlPqn3dc9i8xVCj
         Lk8zze39e8y60uh0Qd9eLFdYtd9xlrEldQGh0KbnMJxtpzPC3RYFDDwKmYJGyHpc6Bxg
         2TKvHTBGVcp5cQKlyvQyyyFur84zy7ANmGtE1PIxH3nJH2WOQ/np8rb0BdQ/1R28oJt5
         Ml1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjLhIA5shjZFlnY92A3HGi1HGtz/0EiBJvFt3K8Ru5erMfSO6J/e6+vnX1K9JQZBQMzh30yydW44+SLszH8vc1sAR9bpvuiO7UT1DQKR+C
X-Gm-Message-State: AOJu0Yy+MNSlTh5lXMX9hSI6QXCohZhZtUa1IShIFnyg+d9AIKeXYlUv
	Qvv1S1W+WXqobVCOzDup4LQoqEUGWCKameFBjLxoLg5qgJlksMVU
X-Google-Smtp-Source: AGHT+IGUnuqe6nNsx1C9flRncYZDiEugVz0qNHANH1ld6VeDjnwEAzPpJND6u8Vu0HmqwKyKXchWeQ==
X-Received: by 2002:a17:906:235b:b0:a59:a532:ed58 with SMTP id a640c23a62f3a-a5a2d55ac04mr1604114166b.28.1716125215759;
        Sun, 19 May 2024 06:26:55 -0700 (PDT)
Received: from gmail.com ([81.56.89.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0150csm1345629466b.154.2024.05.19.06.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 06:26:55 -0700 (PDT)
Date: Sun, 19 May 2024 15:24:39 +0200
From: Paolo Pisati <p.pisati@gmail.com>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Amiga, serial and SYSRQ
Message-ID: <Zkn9lwawFGzSJFSF@amaterasu.local>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>

On Sun, May 19, 2024 at 07:36:43PM +1200, Michael Schmitz wrote:
> Paolo,
> 
> please try adding 'initcall_debug' to the kernel command line.

I'm afraid that won't work - init/main.c:

bool initcall_debug;
core_param(initcall_debug, initcall_debug, bool, 0644);

#ifdef TRACEPOINTS_ENABLED
static void __init initcall_debug_enable(void);
#else
static inline void initcall_debug_enable(void)
{
}
#endif

and TRACING_SUPPORT:
...
depends on TRACE_IRQFLAGS_SUPPORT
depends on STACKTRACE_SUPPORT
...

which are both missing on m68k, IIUIC.
-- 
bye,
p.
