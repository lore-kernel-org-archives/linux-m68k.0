Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A31F211A2A
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735108; cv=none; b=cSrfWV1MlHyJ0MvDsli6AB2geGL8V8fTCM+XFM4QTsjQEqaYhrsfBs8U8sZ09JmVfZNhgMwGJ/5neFsZCfaDIhHoKKNDKjTm+Nn+TwoB8ROqqmbrNji0War7KMCQ2TL7Vre4upYspemLj7F4eWPLZU0557Qvo4atTRkU/VAnmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735108; c=relaxed/simple;
	bh=IltiiCrRl9YolU0T7VhFBVfrtm7CEvSD7AuXoExGGEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adoBGDOs1WDHFKTiUdEs9PsYuggAfcChyvHtkqDrT2a85nSWJrob4T/0sraxRYtEpC0ubRh/dHtgbSKBsx3OOe5AkJv74x6Xv0c80RRqJBmaEAxlKLP7WpU64vRBsPgsPwQTHwbODjQr3kj7426dGsbj58XzCDIx7HNUjzRf3us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-52d9a275c27so3618115e0c.0
        for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 02:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747735104; x=1748339904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjotbf3VcQpX0i3n/6vxPcuCmtGj7oZeczIPGPBX1JE=;
        b=j9RllZgjiFF/3c4Xy6h78u0rWTVdmbVrBOQNAkEfHFwUIgiKfNFE4Nq7VGQ4mvPi38
         fMc0PHGeVmTHt/CARwc3xOLhMlFj9HikUrBQUb/7pluNm3nKiQHV7jihGNFzIa5p87lR
         xFJ9UBwqGR6hkOnF9bg3ZvSxCriROhEROMSUM6mSlsHy6Z0Tjv+M0a65Fkerz9bUDzOU
         h1T/w5Q65gv/SM3xE4pDFxFsB7PxSUYnsLAWPIoDiPJ7MkfSoVDHd+oNio+Zaf2NgLUW
         WKyShyV5RdCexQO0sK7nec7l5HSIya3Yx6MgPhp0s6iPAro36tDkEQHh1Pd6ckx22AuD
         u9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1AgbfNmpGUfuUuU3Xbz8Fw2HfXNlonudgFsPTnOP1QJK10TSmuboMGAEClClrFE4ZhcpDSZhsZQxP@vger.kernel.org
X-Gm-Message-State: AOJu0YyCNYNYnhw4mIYbn7zo+FowqNtwcj8BLsc3NaS0tEnLySx+I/xV
	rYXBbZWFt8rcnTf1hyKFLWH1PjTNTp21b3YhgJVgqAyxnnNDBDVEJEH3YTpBIkfQ
X-Gm-Gg: ASbGncuRiyn6paXOxTwQblYoZfzA+qg4tM5VzB7u95uE7tWtB4aWodYCj65eLU9hpvo
	5UIWJayrLd5TJyipzLEtGYnh/wmF0PBStdVZ2iG2AMZxjjFBJRpi1663sU/QpJcaaGxlP2TIVGx
	LU6TuOaDNVjDWFO9JPZcaXImUAPwK4LEHN8a11qhj+kTwW8LHAevgsacOWR2WybmTC9gdOct0Bm
	lLCjK9BJVk1HsW7r+CTWtse8IT5m5cJC+YHrx8sS2Uye6uBEc9Bh6kfHJw0z1rUTGLFwCpXWuJo
	o9ntXqpCrssx9hZBuOEzYlNz3o0bU2Lg8mWGpL9qjkomJbncvLg6A2HfwfV1TxupEp9syIUxEhR
	CDVYEoKqdbYgK0T7n5Q==
X-Google-Smtp-Source: AGHT+IFLM2b+P3Dks7rOLOoBWi0cu1lditNrreRj+j180iCxD4/qz/BN4XumwTeTp7nLyRWrNoWxZw==
X-Received: by 2002:a05:6122:65a0:b0:523:91e8:324c with SMTP id 71dfb90a1353d-52dba9500f2mr13209321e0c.8.1747735104573;
        Tue, 20 May 2025 02:58:24 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba967b83sm8178699e0c.23.2025.05.20.02.58.23
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:58:24 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52410fb2afeso3644353e0c.3
        for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 02:58:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUop/4XDpL5loXXJpYg1x9L0D2bFnIcRvh2L2CST0/nyc1pj3ERWmVOuSm9kyU+roWqGjycf9KqUYOk@vger.kernel.org
X-Received: by 2002:a05:6102:3ca1:b0:4c1:71b6:6c with SMTP id
 ada2fe7eead31-4dfa6b50ca3mr17288146137.7.1747735103773; Tue, 20 May 2025
 02:58:23 -0700 (PDT)
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
 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com> <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
In-Reply-To: <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 11:58:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVjDGYW2SerNV5ov6jX1pPNw_j1=qpawBCJph18_SE2w@mail.gmail.com>
X-Gm-Features: AX0GCFuOOqUL5LaZPtAqcPACoffHKHDbZnHvgHfL_G8B5CB1SJNKAwJXJ5oHLxA
Message-ID: <CAMuHMdWVjDGYW2SerNV5ov6jX1pPNw_j1=qpawBCJph18_SE2w@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, Florian Weimer <fweimer@redhat.com>, 
	James Le Cuirot <chewi@aura-online.co.uk>, debian-68k <debian-68k@lists.debian.org>, 
	linux-m68k <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Tue, 20 May 2025 at 10:38, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> And I also don't understand why this is even an issue. If someone insists
> on using 2 bytes alignment, just stick to your old chroot. If you're not

What about kernel/userland compatibility?

> interested in new, "fancy" packages, just don't upgrade or install Debian
> Etch or similar. Changing the default alignment does not affect existing
> software.

What about existing software that is aware the minimum alignment is
2-bytes on m68k?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
