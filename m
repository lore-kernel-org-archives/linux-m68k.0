Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476DE14F9D6
	for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 09:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749979961; cv=none; b=FUGButkMtSN10x8ydLMtrbI245xYSAm3t6mkB5/qU8SsRtySquxU8DEGZUm5RaTdMWrzadbEOCfc6TSelsub5qi5znFbj3b8V2aRsm26THQePXryAy+XeIABS7/BdIESLko0935DatHTgtQ4pVeRWq22PDaBhrVFRjtBRCb6SzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749979961; c=relaxed/simple;
	bh=RKasgKyIpCv9jpFBXiaYp5xajoVy+l3nCtrEefRMfLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dx9l3BER3kgmRwyxIslNkMf6RJsvpLESwhv1kb7w1siyi2kQcmabB+4Lt2Z0SNdB4hZBWBzSMoTUqVgS6dqKL57JbwNfEhCtySM+znFAT7z5wvBXtTswzat0AJAkFiwdraFWA7IJ/+ts0X3ax4wltVUUXc/mA4pnDrkE3e/69k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f28565e89so287583241.2
        for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 02:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749979956; x=1750584756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nusEFuBwtkKjWrZQQOjuLpzRwKA17lxrN7GTr5wPIQY=;
        b=XU0sIoB91JSmpBztrp706QtffRdPjvVjfTKemFyY59FF/8dbB33siITZcghvmKYK2m
         yVgSowYjVSH9fAmVPmkmMIVPNehgjmdlMBNkNXkDiDD+R0plUXje4SBYY/vSfpqKq8wu
         x/tkUbQVjoANJLARVVxgyzSNr9tQw2iVxPKZrRw+1blqKPlafEmAoPaQhMB0PPysmb4i
         Z5vm+c6O8hjY5VE8/Vm2HhthNAQFijWF5VIAIvmrE9ztgwtAC6yqXoHHkdBqPisXcWb1
         Z3s8+44ie2XDU0XHIIdDZ2lKOnVI40SQz0+lBfp8dcf1yk3nZ07UIreCvfDRGZW3Bh/U
         KxBw==
X-Forwarded-Encrypted: i=1; AJvYcCUdwq7k8ByrtV7HVjYkxXymlPVH/OpmgGIB7dHYCSEi73sFNxvtVVmJc2Lksq3UlwEjlfIJfluldXj9@vger.kernel.org
X-Gm-Message-State: AOJu0YzFTnIFhaftiFGwhbRxHAWRR8bshX4OLKc2N3cu5Yc+Bu5GsoL2
	/mHehi/ixRFjuyZ73fu6AJaWja1opkRk+NEnr7tPiNdxrAo6o35MEk/oVU9P4p9x
X-Gm-Gg: ASbGncuhFWzqIrZ7X10deqM+V4MfShhxqSnVI0RjqvA7viqUgVEl4+yhDh3C0DFmwZA
	++DA7vyon5fACmbW6wrvqFFH9n1hlspj0WdgfvHMurvU87o3PUxMWmb64s94yAyoohEBrjZL78K
	rZIt8v1ccfPcK2eKma4GSmuTaTfS4qbx7nRxComMcD/GJEQB5gESFE60j6Ur2zYtoqb1mLA6uud
	OKH+woEHzKhAIje7nUut7DVPOvgPmO28p/LrHcGVK1WblIVSe9CPgC/SMgE3M7hytjJjX7YAf8A
	VrtOYtWJkDvOPceSFlJw1r/oFURY49bDoLXfGLHZpvy8EkfeZlauhZnDiEj9dbprlYcKK6cx/J6
	7dNWXYUpc/2FZHv8a1J+LiZMk
X-Google-Smtp-Source: AGHT+IG3jMUymOSS+1xIrluxe3QHizhvLXXvQxdGK8nNN7E79vB43k7JOpRlFBeBMzufN/R+Zce7eg==
X-Received: by 2002:a05:6102:4b8c:b0:4e4:f503:6675 with SMTP id ada2fe7eead31-4e7f61f45d2mr3768378137.18.1749979956394;
        Sun, 15 Jun 2025 02:32:36 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f2dc41124sm81095241.26.2025.06.15.02.32.36
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 02:32:36 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e80d19c7ebso563975137.3
        for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 02:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXc78bPuCCOqYT5c0wBSi/aiDT9C7FxzeSlhxaP0lkSH+XQUvjz9RFRqGWkdHn76y8hH35TM2ktmJWg@vger.kernel.org
X-Received: by 2002:a05:6102:1483:b0:4e2:82c3:661c with SMTP id
 ada2fe7eead31-4e7f614bf0amr4473623137.11.1749979955992; Sun, 15 Jun 2025
 02:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi> <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <86c91d1c-cfc6-44c9-8883-d9ae46c3f4c3@helsinkinet.fi>
In-Reply-To: <86c91d1c-cfc6-44c9-8883-d9ae46c3f4c3@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 15 Jun 2025 11:32:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVL5mWGstzyik11iHyoBf-mUtwnPiCLM12qurGjHYSbkw@mail.gmail.com>
X-Gm-Features: AX0GCFud1nLpbAVh7LkB4pxOCpjuf5qm1Ee3bD586ujV_RZbF6nuUtYJGF5VsSg
Message-ID: <CAMuHMdVL5mWGstzyik11iHyoBf-mUtwnPiCLM12qurGjHYSbkw@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Finn Thain <fthain@linux-m68k.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Eero,

On Fri, 13 Jun 2025 at 21:29, Eero Tamminen <oak@helsinkinet.fi> wrote:
> On 13.6.2025 17.53, John Paul Adrian Glaubitz wrote:
> > On Fri, 2025-06-13 at 17:15 +0300, Eero Tamminen wrote:
> >> Wouldn't next upgrade completely break user's Debian system so it needs
> >> complete re-install?
> >
> > You would need to extract the glibc package manually from my tests. After that,
> > upgrading the system should be possible.
>
> I think quite a bit more binaries than just Glibc are needed for Debian
> upgrade tooling to work, but OK.
>
> As to other potential issues...
>
> I assume there are no m68k port packages with closed source executable
> code (FW) [1], like the other architectures (esp. x86) have & need, and
> that any code intended to work also on non-m68k platform, should be fine
> with 4-byte alignment.
>
> But what about m68k specific C/C++ and assembly code that may hard-code
> 2-byte alignment assumptions; is there any tooling to detect (potential)
> alignment issues in those?

This is one of my worries, too.
The Debian package archive is much larger than the NetBSD one...

> Or is the plan just to rely on packages' self-tests to reveal issues,
> and then track them down from there?
>
>
> [1] Are sources for "bootstra.tos" & "amiboot" anywhere, in case they
> need updates:
> https://wiki.debian.org/M68k/Installing
> https://people.debian.org/~wouter/d-i/images/20130502-06:51/tools/atari/
> https://people.debian.org/~wouter/d-i/images/20130502-06:51/tools/amiga/
> ?

https://github.com/geertu/m68kboot

I don't expect any changes would be needed for the bootstraps.
FWIW, include/uapi/linux/zorro.h already has __packed for the various
AmigaOS structs, as that was needed for APUS (support for which was
removed from the kernel a long time ago).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
