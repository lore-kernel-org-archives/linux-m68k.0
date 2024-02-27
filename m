Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F4B14F961
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 22:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709072736; cv=none; b=hu8NEA6Kj2TfgOCE9dA7qOgCX0YHuHR6r9cZyOthMunnd+IX7e93X/AT3D9Gnp2eOSyXjHu2Nu2ND8XjHrtnhQWVLoAVuQ3oH19GmWMe0HL9MX17BGXhZIKE56djEB8S6Wwfcuv6r6FWmgcbIYPgmNu+OGKTvNVlDvRz1bqY8AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709072736; c=relaxed/simple;
	bh=BZY4406wVhBlJfwB6Ze/m6sBQx4rV1wHkhecYYyQdRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1quMnmALqd2f1C5FWHVNYkM2pJCyzOYJ5ZbWLpmGjiIhwFvCDDg4T/EB9Yy+nMtLvCeejTgL/3naIhG2BTlpL2gl7wbn2U8fXce2tU6l1ixZxXPXi778G7PqoASPNA31j5sAFGlqROrB41oOI4g9YukX5s8PVKZpFqdBpRBeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eD4I++mN; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eD4I++mN"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-365ab9e9e31so4105875ab.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 14:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709072734; x=1709677534; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CdXNDkfHTZPTT3aVBNl95bQTluN5p5khhWSdLMgwQYE=;
        b=eD4I++mNENR035awY/tRPMOOQ5tEa61tayFDYvv4g5C82oGYt5H7cKoVLJhA8OmlEs
         3PxrSStzG5cw6lAL/E35tPX8AgkdsxqSnH2uVRz3mlbKWsfqWLCDE1oonA/AV69nncuu
         e+0mYmVgLCy+OduQqC6XMxKSpGF116ZJRzZuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709072734; x=1709677534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdXNDkfHTZPTT3aVBNl95bQTluN5p5khhWSdLMgwQYE=;
        b=QZd8Rz5xe85SAyq+jjhkDtqx4qlzgCMZv/xC9CfGt+eJc58uZW6mHG448S26CjwUTu
         KuWjEoVFVocbULzngfbmx9lIHVlX58je13yjx6INDGvWhzBfJ8N103HSJoBGNWnxKA7e
         tuiFtVfiJLgHAQywde1Lrj0Sqjpv/c8YoCLqrb0YQaeMVckXViF6AihNLlfXgkrpwzO+
         cSBGQh6gGt2ze0pPQ1IbtdN8wPRZIYg/1u3JEvOrccfnDfi0w8FnnM5PU3PwmU94c6RE
         xSgxDYLJTtV24kOOhCaNCgtPk4hHgxVVUoBkGu2T89SbJdT8L0O2XTVNd9bN37SPxTt8
         EPCg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Kr+hJO3ObjTJh1wrNjTy2ifVScvXTqBBzNyEAxgwjeA//2/AsvxKDaOC4rwnX5WZMPWTJuOEa1DYBnXUuqz4O+9Mj61Ctrh9o/Nn+zQv
X-Gm-Message-State: AOJu0YzNO55hRvpJsRpEsKtuCApZ9b91EaYPrL8pt0u8D5ieGbEJgott
	6MRohTUCErByE9tLoCRYO7msrKS6N0os0ZDHmXx5eIjdRRC7s8KTRBujl0CMOg==
X-Google-Smtp-Source: AGHT+IGYBuwXLHIC8vZCmts7zTsMpo7UiyuHbbLT+oFTxhaG3QafWqmUk98iK4Wky6XsIPvMdRF6fA==
X-Received: by 2002:a92:c606:0:b0:365:101e:b47d with SMTP id p6-20020a92c606000000b00365101eb47dmr11694652ilm.0.1709072734378;
        Tue, 27 Feb 2024 14:25:34 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l3-20020a62be03000000b006e4432027d1sm6586909pff.142.2024.02.27.14.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:25:33 -0800 (PST)
Date: Tue, 27 Feb 2024 14:25:33 -0800
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: stackinit unit test failures on m68k
Message-ID: <202402271423.270DBF1@keescook>
References: <a0d10d50-2720-4ecd-a2c6-c2c5e5aeee65@roeck-us.net>
 <CAMuHMdXMsxRRMV8g6+9vTy_4o8HF49SUh2deNdFjgKwDLEWrxQ@mail.gmail.com>
 <202402271401.CB43AB2E8@keescook>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402271401.CB43AB2E8@keescook>

On Tue, Feb 27, 2024 at 02:19:07PM -0800, Kees Cook wrote:
> It is basically doing this:
> 
> static void *fill_start, *target_start;
> static size_t fill_size, target_size;
> 
> static noinline int leaf_char_array_none(unsigned long sp, bool fill,
>                                   unsigned char *arg)
> {
>         char buf[32];
>         unsigned char var[16];
> 
>         target_start = &var;
>         target_size = sizeof(var);
>         /*
>          * Keep this buffer around to make sure we've got a
>          * stack frame of SOME kind...
>          */
>         memset(buf, (char)(sp & 0xff), sizeof(buf));
>         /* Fill variable with 0xFF. */
>         if (fill) {
>                 fill_start = &var;
>                 fill_size = sizeof(var);
>                 memset(fill_start,
>                        (char)((sp & 0xff) | forced_mask),
>                        fill_size);
>         }
> 
>         /* Silence "never initialized" warnings. */
> 	do_nothing_char_array(var);
> 
>         /* Exfiltrate "var". */
>         memcpy(check_buf, target_start, target_size);
> 
>         return (int)buf[0] | (int)buf[sizeof(buf) - 1];
> }
> 
> and it's called as:
> 
> 
>         ignored = leaf_char_array_none((unsigned long)&ignored, 1, zero);
> 	...
>         ignored = leaf_char_array_none((unsigned long)&ignored, 0, zero);
> 
> The first call remembers where "var" is in the stack frame via the
> fill_start assignment, and the second call records where "var" is via
> the target_start assignment.
> 
> The complaint is that it _changes_ between the two calls. ... Oh, I
> think I see what's happened. Between the two calls, the stack grows (and
> is for some reason not reclaimed) due to the KUNIT checks between the two
> leaf calls. Yes, moving that fixes it.
> 
> I'll send a patch!

Oh, no, that wasn't it. Something else is happening. The stack pointer
isn't moving between them. Is there anything special about character
arrays on m68k?

-- 
Kees Cook
