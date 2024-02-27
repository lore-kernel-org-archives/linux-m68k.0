Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D5C4CE17
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 22:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709072351; cv=none; b=mD0IJwo4jC+6RHFlyo2xqxvlQXWp4/EmJXwdiGroUOjypQbq7I549fVITitXK4SocNqNx6OgCJU8FRfewtKczVfSjmo4WRP5IdOyi+85lLQSsL/snraQJrukDA9F68SPcnyuVQ2I0ICu8XHJXTbdyIXIsRH+ZrhXwEMW3/g4Vas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709072351; c=relaxed/simple;
	bh=gUm8H8I+QgXLVB74DB6uSSt5ePpLI9Jus5D3udBOKFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvK1FrSDkMh6KPvyopIFsFrY4skK75szN7awviEF1R7Q4aTBLtwUboD2B0hekZ5gL4PQiYRQA55ay0qdKG+HpauqOQ18MvxSZsCsL6/KxBZsiLF5qOUaPRphcctge6O8QDRu122zDV2oj9+UTFWZ1p/uHfAG3OiCjkJm+Fs06g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cNdM8lIS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cNdM8lIS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dca3951ad9so25056945ad.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 14:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709072350; x=1709677150; darn=lists.linux-m68k.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXno1hnt7boGnl19WCbZvgiFqTnjZ41kOP+QrpWStfo=;
        b=cNdM8lISFXygoM+sqDQXj3rejabdQZFPRT02AIFiuqW7k/mFFYI7LZa33qluODKcyb
         C/q6Q/Zd9Q2O1RdRBBGSMJNpVRpUzLmmcHVPcS3lZtjt6x9nuC0NrrGrpkXCCekH1O0/
         9nFZe4JK9rFsTiG4c1YcPYMw59YYg6S11evtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709072350; x=1709677150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXno1hnt7boGnl19WCbZvgiFqTnjZ41kOP+QrpWStfo=;
        b=siaq7N60y+NZd+iqosc8KJ2HZT30RJ1PSEooEJwyonvDIVgnwMVSGF4IBfT8kTVsPJ
         wqP3pxkzVB7zdK+VWU8xcW5C+N6HLe0jLPFSJMjmTYxuhPoK93t8RK3QM+t8yCFo7F93
         GsMD7hrkfkE+VhwkR8dxvL4QtHAOFrDx+HeXte63QMI1/Vj+hU2sFdNi+By3nfZikky2
         whmZExePDEBhssNvvfD8jrLd7DhQ8FAiXWcSS7+x7R9W2G0Tm0VaP0WViPu8vsGln8gc
         zJoDbju5H/rYk0r6+FdU1LIc5LxjDCRiykM12j4VWthUQHub4d84YEjqyDWZ+qfN/kvn
         g3zw==
X-Forwarded-Encrypted: i=1; AJvYcCWY22d5+vT8VH4MOAWsh6c3D6isGyeLrZNbkNOVSBDDghtQLVYsuSGSlbJ1NHy5GHorHKY6w/Ta49JHwr73qtUHeuxuZZmrQyK86E6bdsvn
X-Gm-Message-State: AOJu0YxS6POjvy8pr0tbOnUetUtVEOsZCv7eiItOoEaPBrFcfHwfUqKh
	hBvvoVcN87jQjD2tAiJAc3VG8vmPdapei8Q48HZR1z5QCEMSElFGTVOaSvea/w==
X-Google-Smtp-Source: AGHT+IG+T1sHKc1Q9CDhQJZHUfw1f78cfUc7tp8sJTwGJrblb9ZLNC6Lovyr5+eIAS7QGdDeOkubAQ==
X-Received: by 2002:a17:902:b7c4:b0:1dc:b01e:99d0 with SMTP id v4-20020a170902b7c400b001dcb01e99d0mr4732223plz.1.1709072349723;
        Tue, 27 Feb 2024 14:19:09 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id la3-20020a170902fa0300b001db5432449esm2022819plb.18.2024.02.27.14.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:19:08 -0800 (PST)
Date: Tue, 27 Feb 2024 14:19:07 -0800
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: stackinit unit test failures on m68k
Message-ID: <202402271401.CB43AB2E8@keescook>
References: <a0d10d50-2720-4ecd-a2c6-c2c5e5aeee65@roeck-us.net>
 <CAMuHMdXMsxRRMV8g6+9vTy_4o8HF49SUh2deNdFjgKwDLEWrxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXMsxRRMV8g6+9vTy_4o8HF49SUh2deNdFjgKwDLEWrxQ@mail.gmail.com>

On Mon, Feb 12, 2024 at 09:34:02AM +0100, Geert Uytterhoeven wrote:
> Hi Günter,
> 
> On Mon, Feb 12, 2024 at 12:06 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > I see the following stackinit unit test failures on m68k when running
> > the q800 emulation.
> >
> >     # test_char_array_zero: ASSERTION FAILED at lib/stackinit_kunit.c:333
> >     Expected stackinit_range_contains(fill_start, fill_size, target_start, target_size) to be true, but is false
> > stack fill missed target!? (fill 16 wide, target offset by -12)
> >
> >     # test_char_array_none: ASSERTION FAILED at lib/stackinit_kunit.c:343
> >     Expected stackinit_range_contains(fill_start, fill_size, target_start, target_size) to be true, but is false
> > stack fill missed target!? (fill 16 wide, target offset by -12)
> >
> > Do you happen to know if this a problem with the test, with m68k, or maybe
> > with the configuration ? My configuration is based on mac_defconfig with
> > various test options enabled. I use gcc 11.4 to build the image. I tried
> > with qemu v8.1 and v8.2.
> 
> Thanks, I see the same failures in the logs of my last testrun on ARAnyM, too.
> I haven't looked into the details yet.
> 
> Only two failures does look like a nice improvement, compared to the
> previous time I ran that test ;-)
> 
> https://lore.kernel.org/all/CAMuHMdX_g1tbiUL9PUQdqaegrEzCNN3GtbSvSBFYAL4TzvstFg@mail.gmail.com

This is complaining that the stack frames across subsequent calls to the
same leaf function don't end up putting the same variable in the same
place.

It's a rather difficult set of macros used try many different
combinations, but it's specifically talking about the "leaf_..."
function at line 208 of lib/stackinit_kunit.c. This test passes for all
the integral types, but seems to fail for a character array.

It is basically doing this:

static void *fill_start, *target_start;
static size_t fill_size, target_size;

static noinline int leaf_char_array_none(unsigned long sp, bool fill,
                                  unsigned char *arg)
{
        char buf[32];
        unsigned char var[16];

        target_start = &var;
        target_size = sizeof(var);
        /*
         * Keep this buffer around to make sure we've got a
         * stack frame of SOME kind...
         */
        memset(buf, (char)(sp & 0xff), sizeof(buf));
        /* Fill variable with 0xFF. */
        if (fill) {
                fill_start = &var;
                fill_size = sizeof(var);
                memset(fill_start,
                       (char)((sp & 0xff) | forced_mask),
                       fill_size);
        }

        /* Silence "never initialized" warnings. */
	do_nothing_char_array(var);

        /* Exfiltrate "var". */
        memcpy(check_buf, target_start, target_size);

        return (int)buf[0] | (int)buf[sizeof(buf) - 1];
}

and it's called as:


        ignored = leaf_char_array_none((unsigned long)&ignored, 1, zero);
	...
        ignored = leaf_char_array_none((unsigned long)&ignored, 0, zero);

The first call remembers where "var" is in the stack frame via the
fill_start assignment, and the second call records where "var" is via
the target_start assignment.

The complaint is that it _changes_ between the two calls. ... Oh, I
think I see what's happened. Between the two calls, the stack grows (and
is for some reason not reclaimed) due to the KUNIT checks between the two
leaf calls. Yes, moving that fixes it.

I'll send a patch!

-Kees

-- 
Kees Cook
