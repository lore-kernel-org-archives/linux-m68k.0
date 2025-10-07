Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA22255222
	for <linux-m68k@vger.kernel.org>; Tue,  7 Oct 2025 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759822993; cv=none; b=dv0yhJNp+yAptMzIGSBZqqsvvj8xAfjVdr4MdsygRgMyJPNLLi3tLEYSKI63M3ryObndVxwPh6VYA1rLJJX9aVIRB7sp9RVuolp6gRsv+Lg9+h1fYf5jNgrC45hEZcom4AEH3JYQ4iDnc8Htd3O0wbtNVN1KHWrkQ5az5VmewKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759822993; c=relaxed/simple;
	bh=yD3QIkLWD6CmpQEwsafFM6XowJaBglaGuKWBSqHUs7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qU8ja9aV4qHJIoZlJKabqWiA2LU/rY4WZvpb2TTPoqB9oDUEpYKC8dSzEBbIROhSd7aH22wp88AFHjRHXc7vSUcz4+u4P8YuNC4Krl8B3eaIbQbLd8H/6pamzNktf8veevGblzpJ0XhoJMN8/TNhppJO/n7pQhWbeIMR+micog0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-556f7e21432so4809373137.2
        for <linux-m68k@vger.kernel.org>; Tue, 07 Oct 2025 00:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759822990; x=1760427790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7xFWmE6FERg0BV2hLFsu2RpZYyTvYQhUdrHdelRqPs=;
        b=pN8EmNLe7mseWpZpL3kEOUOChGgRn5CDwrWKA2nUrp5KcuaEEssABIt9vlGI2VUf3Q
         sThefTj1/rek2KquQ7/souSp3+3OOFp7qmUy7MkheHgSm9W8n/3J07DDqHxIjQXHAc8s
         WMYpddXNjTQ4q3U+zOiqyTmx/a9WvWAK4Qx0lXHxyAC/5iiqSfYTTBcu3wDkznl7fk28
         djXJx2CJ+z4STS755aY8tlx/Kh6WLqmXYuywD6/2DO84JpkJDOSwpX+YJiNxImi4FJ4P
         Tj6dPSNzzZRCfoqFd7Fjqzs6Nym9AozeCo4ikCTvHuOcMAO5zuTbQpY7+awEUrI41tPR
         GmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Hvhog66YJZQumnGv+X9bwcOfclMVuWbTxvHQOfJP0yEMBIzd7v/IQ31ZGTFJXO+CyLx7TMiPpCoW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Er98h5mLAtUWaPXTZn27oo4Jl4b1HBNu4lRcXjTrOxKjQfLc
	GzoKmnsP2Se7lafXg75iLS3whCwRGIe94yqQ6jD68kw6oy+w8eL9R63k8EPqSEYJ
X-Gm-Gg: ASbGncvP8kTbCn/OPb80cBVFl5OQm7qlbbE426xEm/muqEQqfqle5Wr6Dt+ERhjW6Rs
	gG+huSNc0kRaNpS0ZkIZzYUzURo7WAzVfQG7Vt5OvMABbPrauVzKVlanCS+qWlMWyKES3FxwuDc
	BkBjXbE2FwGRTk6EEEoLoLjhQwqqINsv0HTcg5fe5DkfeK77J3jctSe80fRRP+HaKao4QPI3eg1
	3Xa10wHmfyixhpk9FYwa4O0gbWjbbD0NhLTkRC2fAgSTKCHRcJeFuoUzBKAaXcpqtFBx7Mh78AU
	Z2L2dwtpnsa5DbmT+1chiU/B+pjqTTRk+mv69lidmv4o1STOxqeJVU0o7swkiZQimNp7wQG11jD
	DFIsv2qUrLeZOmgqK7+ON0Vhj4rtNGU2U2nmbcAr5BFnKjUy+BCzPPJuJVkF2Go0+BDHK3Qrf2w
	qhQCzHA360a2oepS+g0o0=
X-Google-Smtp-Source: AGHT+IGWdxlVHDNKFh/+x2XEozuMzvPYABUuFZS26aV+LCID951ZrS0sse4pWmKxgHsIJoZjVAHCbA==
X-Received: by 2002:a05:6102:b15:b0:55d:cfa5:9d52 with SMTP id ada2fe7eead31-5d41d1423e3mr5992329137.27.1759822990433;
        Tue, 07 Oct 2025 00:43:10 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d383430asm589224137.2.2025.10.07.00.43.09
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 00:43:10 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so5011586137.1
        for <linux-m68k@vger.kernel.org>; Tue, 07 Oct 2025 00:43:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9DDu9rgdmjLITNw2IOSLm4Tpg3AUW4Pk+zCfF9xYIlnEePNU+Ow+j/d/HUYBFIELr/zvh2hPOmHIg@vger.kernel.org
X-Received: by 2002:a05:6102:2acb:b0:5ca:a978:8a with SMTP id
 ada2fe7eead31-5d41d1728f1mr5458809137.33.1759822989670; Tue, 07 Oct 2025
 00:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
 <mvm347wjj90.fsf@linux-m68k.org> <CAMuHMdXdeJ6Bq=zA7QcN82YNaZW3R8ebeXpGzqHus-KPkSj5XA@mail.gmail.com>
 <20251006180201.GA429708@ax162>
In-Reply-To: <20251006180201.GA429708@ax162>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Oct 2025 09:42:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi09MEU+AUE7C5OtJzO1ZiQ-1OVVi9EWNxt7vHA3ZvVw@mail.gmail.com>
X-Gm-Features: AS18NWD5V9LmBNtT9znIAEdUf0-LOhM5TAhAk1S7CGHt0o8L8arsWU6hMHw8j3s
Message-ID: <CAMuHMdUi09MEU+AUE7C5OtJzO1ZiQ-1OVVi9EWNxt7vHA3ZvVw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: uapi: Strip comments before size type check
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Mon, 6 Oct 2025 at 20:02, Nathan Chancellor <nathan@kernel.org> wrote:
> On Mon, Oct 06, 2025 at 03:20:52PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 6 Oct 2025 at 14:40, Andreas Schwab <schwab@linux-m68k.org> wrote:
> > > On Okt 06 2025, Geert Uytterhoeven wrote:
> > > > --- a/usr/include/headers_check.pl
> > > > +++ b/usr/include/headers_check.pl
> > > > @@ -155,6 +155,8 @@ sub check_sizetypes
> > > >       if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
> > > >               check_include_typesh($included);
> > > >       }
> > > > +     # strip comments (single-line only)
> > > > +     $line =~ s@\/\*.*?\*\/@@;
> > >
> > > I don't think you need to quote the forward slashes in the regexp.
> >
> > Thanks, you are right!
> >
> > So far for not just following my instinct, but looking for similar functionality
> > in other scripts like scripts/kernel-doc.pl...
>
> I will fix this up when applying. I think I am going to adjust the
> comment to
>
>   # strip single-line comments, as types may be referenced within them
>
> just to be a little more verbose about why it is being done.

OK, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
