Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25FD3FBB3
	for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154374; cv=none; b=CIG3reN9pJwSVpo+17sOP2RD4GSmrWQWcrqIvBaLi+LMBkqbthJpHSf+8jVzJcsyMQJXz8qaGBouHIUf+E3J9/+ue02yJWJVbEDzXRVQqfdlQ6aIRjyd1YDSuNkeOOlr6WUJi881W5glMUgpP21DJ+WHSprI++CkSKgG0F4TwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154374; c=relaxed/simple;
	bh=6Q/zILH7K5S8dWYvYCsBWbV69+T0M5zxBw++LJFIOR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rj/quRp+vI4X2dSnPnI+axuxHoHrGHAAdC+esnZNcWmTL6YTUDZM0+W7wCJErZLY4Vdumw7IaTCo+SkYnZOnTIE9RIGoyv4xHutIiJILTkVoFDoAKlAciNjS6wpc7qmAXLGspDblnb1f3JY4YLhPCk3xiYIYiX+79DGkqSM/XT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-53185535ed9so228935e0c.0
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 02:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750154371; x=1750759171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9CXKQ3n2BdLkmk4i7IfIb7gMiukXFlnmaB10vMC5sI=;
        b=DzBS1seaj+WGuYbbg6GgsxOSI+mRuWC6cTjNIiZhN9QYS7WAv7Ce1YjoR2Af6+toF0
         qjhANBx8rHWWvKCMkcxtLMsnfX856geeoVU+g8ideFBQ6PwFFVgWrZQC4SftwFswCTeK
         C71AN7G96L+ggUM/FZX79bXHtvqtC6vSCKyNzlVJDFphyF9q4s7IXUUBctpNUspYdD9M
         lVp08TehdUyeoqomFWNc5Yam1GWEadrr/9roWgC4aWK+HgKd2BE6LSFTOPATkGlL1B+D
         sgibL8F8+K4CAF9b22PbZ6Lb/iKwYl3BHKT6YzwgK0irad1yalMyZNtSkYieE7BDoQ57
         ivXA==
X-Forwarded-Encrypted: i=1; AJvYcCU9t4RB2GXxMwUy41DDdjl5nnTa8zimVoS95hNyhjs9P+blhhjsPdImVCbJaJfp5KhX3T0L2LcZ6mDn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9pgOCFSOlX/1nQv+MG53M+MN8+zX+RQ4R6j9f5l83Gx0ECGtC
	+YL87XzMpULejLNda2itjh7r1a+3e6i2R981cRgNE4sKdevBnH6iyQpMZjVZ6XOI
X-Gm-Gg: ASbGnctLnuCrFjiUbY/of9snknrYLEqfucsQi5BzUe1poQdYh765GTkXqG560cmMV2s
	7fGP0tskkDxfoW+19t1bp4gFKg9k9ZWdvqT6Dwv26lJ6uUooNoFav2iiak6tKnag2fnJ48oOwLw
	SyUvPL6JtHCK99XJP0h0Q+0YrApLbu4c/KYSQ/mWeZQfcpS9QnL7QG9bnQLIdZ70e+vAiTCt4eu
	tSIe6TFVVOJUcCMAcTUj87uioiVxGxxHx282r5XtTMW0LkYWa2hXpbk+/BPZUwrdRFfkug9dXdZ
	x0yeG+kR31mqxbuh9lBDiXWzY7eNNbHSuPtln9mb9iwvdiQ4sVb/kvCTwFo2rUGCYf2h0ss1f5r
	hWM9kqdlzjIN68c/rE30Z39FG
X-Google-Smtp-Source: AGHT+IHuy3nUW7zbymFDwEEX2wTI/mRNt4Q1XJ7BiGxAbXUV6sISjhWJr75Ao8cZJ4RsOsY/8Aq9jg==
X-Received: by 2002:a05:6122:4b15:b0:52f:a0c8:263d with SMTP id 71dfb90a1353d-5318117eef1mr739475e0c.5.1750154370638;
        Tue, 17 Jun 2025 02:59:30 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313e05e643sm1567635e0c.43.2025.06.17.02.59.30
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:59:30 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e8088896b7so2042256137.1
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 02:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTKlG0vwfCky2fE8BbvbkuUlysip+yELifEeMSJsUZ2VqWvuUdFDDUCcb5d9XHv39RrBEPsr4JVUEP@vger.kernel.org
X-Received: by 2002:a05:6102:5cc2:b0:4e5:8d83:c50e with SMTP id
 ada2fe7eead31-4e977cdfe4amr832758137.10.1750154369949; Tue, 17 Jun 2025
 02:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
 <8734d1kofn.fsf@oldenburg.str.redhat.com> <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org> <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org> <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
 <CAMuHMdUznJ3Zm9JnhLG4MmEO1WODL0bddwN4rvO-eTdVUDzFjQ@mail.gmail.com>
 <bf1e84c20996f003645a182d46535758fea10b74.camel@physik.fu-berlin.de>
 <CAMuHMdV6zMWPOD_t0HoWgJDeGJardpqKgbZb9+HLCJZPsp-yCg@mail.gmail.com> <dd408059d1861b055623386e1b8aac5c5bd53e49.camel@physik.fu-berlin.de>
In-Reply-To: <dd408059d1861b055623386e1b8aac5c5bd53e49.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 11:59:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgqoFo132WPzAFcEG0gdxkCHA98jzek9b4Da+n_xOvwA@mail.gmail.com>
X-Gm-Features: AX0GCFvsimJ6GsQyR0w7n7PsmnSOMDdXCLy_iaPfNENfimkHZa-sy-gfPLV5zA4
Message-ID: <CAMuHMdVgqoFo132WPzAFcEG0gdxkCHA98jzek9b4Da+n_xOvwA@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: John Klos <john@klos.com>, debian-68k@lists.debian.org, 
	linux-m68k <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Tue, 17 Jun 2025 at 11:48, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-06-17 at 09:40 +0200, Geert Uytterhoeven wrote:
> > > What's going to happen when Rust code becomes mandatory in key parts of the kernel
> > > and then we're unable to build it because we insisted on keeping the 2 byte ABI?
> >
> > We fix Rust? ;-)
>
> What's keeping us from creating an ABI v2 using either e_ident or e_flags from the ELF
> header so that we can fix also all the other packages that don't work like Javascript?
>
> If MIPS can have a plethora of updated ABIs and even POWER got an ELF ABI v2, why should
> that not be possible on m68k?

IBM annual gross profit for 2024 was $35.552B.

> > Is this a Rust issue, or an LLVM issue?
>
> https://github.com/M680x0/M680x0-mono-repo/issues/10

So you mean it's an LLVM issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
