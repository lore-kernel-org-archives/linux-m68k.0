Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02592F22
	for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143753; cv=none; b=JK5DVXiMO8NZ062te4RsMWtbAcMHTb7IVIs/GYPkbQBvHBuLwWEuvbHTSLRf0uS0DB4uFE7dUFCkVTrey7Nm+A4H92A/D6O08thiBW/ZPGpAU4j+DUobf8Rc+is550F/gdadMRi+irCNPN3dZXCK9yKUwOQMfKdbz5Eg5+e5bXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143753; c=relaxed/simple;
	bh=Tm9kDsFIvUxTYk5/GKIChfKwFGYUgIyZxjjk73Yhi7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5pPm7iR5AHE2cGKx3B/0fPPC3MHIEqH0gCG17ITSzeBme/BiYkgx+srPLX3lZZJVegSUDA4OzMgL6f3WnUwq74U2bc0NXN6Q9gJrt+f3v7Vflu80J2h47lOhL3dP2qoKg9Idl7vA7bouHLaz2ezfprUyOLRpfASiaIjWZTKNP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e8088896b7so1950062137.1
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 00:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143749; x=1750748549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KYnDHl/VbhqSpaVxNhMYw/zXz0a4qAxZjeYwz7XVVU=;
        b=ZeW6bS3KX+H59tLip//0UG4jylZ6Eigp36BOJuVKWe3AtW+tj0J/41WNU5Us7w8vKZ
         JNdc8itHVQg1CJKD+GjrzB6P2ODnkCOvsiNnRdprTh7yGQN5qGWLuRi2k+tpfjskFbDv
         wX7HL6aE9QnWn5zsA1RYZumcQ4SbM9n+j1Bkuil92jZM1B11yvYt2W90pUk3u8Jq9XLF
         cbG7JhoWH4+CRb0fE+RxgDgRStTqQg4YDwf3+RfMOKW0GNNWLU1PUL7c/IsRYElNLK8e
         hg+GZS5sSe/KLFPEs+jShpA7w4/actXiIroRjXUu0xGntO7Az1ehGFtbWf1wefld+H42
         Fpzw==
X-Forwarded-Encrypted: i=1; AJvYcCVe9f8fTHTvu/RVt8RJKAt3CpnOU45OVnrskNmuJgAcM+7+jmScfUVT8dlLl9Wc8XdU5Bf2AUmZ3vfE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7kSQ2t9U+fuB6LqRazQiPIs7lhqSbKyeCz2YliwpqbErb8RSj
	3WgPdEAOd40MPbIs5RUpIGoFVZV6xVNC6buq0z6k+rSXNj44RKMBAXIW+wP+78+g
X-Gm-Gg: ASbGncvY/CMebo4MFU8A+324h7z7/+gCv52WM1pufVv2YZktFFmor5W7DhOK3+ar1sF
	QFjm+IIqPuT0oY5679hBKOG2clQQNz5f/UoS93PN3I8q8bQHxT2elQ7tU2PZVhFCUUbC7gI4CnD
	zR0kAz6VWQ3fshC8rkjA9fE4kgxCCrhmulplUuFZo8VChLC3PaMCGVp8xmfgI4WtNblCCfr+Za1
	Zw1cgpLVl9TsQDHZ2cwgRPWalMkJ4DqyRYs7HNZ77ftnsipd8LghM8Qx2UVNmQm7bZ9Yq79fbHf
	e44ZJLKQDLpobv+Tg6DDOAqrXBI4y9db0WgISlAxdASA1vX94i11zF9p06xtNBYnozTwvfZ6hJY
	RpKBaZQN6m8aRc3yX2QxvuC6p
X-Google-Smtp-Source: AGHT+IFlhp6AlldVt1hcciSBr5XPZvlpi88caQqRs80wjKrBdUw9jp7a7TQkY7feDp70vNDatA7gDw==
X-Received: by 2002:a05:6102:161f:b0:4e7:df03:ea26 with SMTP id ada2fe7eead31-4e977acc13amr637686137.9.1750143749202;
        Tue, 17 Jun 2025 00:02:29 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e7097e5esm1561730137.15.2025.06.17.00.02.28
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:02:28 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so3578825241.1
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 00:02:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkFxYci5qh2yexwbK+DXmC7K4FaxwLlvCxYrG85qCSN8E0KqYyTJUEo1rUQ6A1/Opa+LFgHstV2j+J@vger.kernel.org
X-Received: by 2002:a05:6122:3bc4:b0:531:3a03:1122 with SMTP id
 71dfb90a1353d-53180baee1emr679720e0c.2.1750143748509; Tue, 17 Jun 2025
 00:02:28 -0700 (PDT)
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
In-Reply-To: <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 09:02:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUznJ3Zm9JnhLG4MmEO1WODL0bddwN4rvO-eTdVUDzFjQ@mail.gmail.com>
X-Gm-Features: AX0GCFukjyDdasSMjYiJfqVkmke0GGQOxR381YkKn1TFaYtubIvpvdA8AjkfbLU
Message-ID: <CAMuHMdUznJ3Zm9JnhLG4MmEO1WODL0bddwN4rvO-eTdVUDzFjQ@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Klos <john@klos.com>
Cc: debian-68k@lists.debian.org, linux-m68k <linux-m68k@vger.kernel.org>, 
	Libc-help <libc-help@sourceware.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 21 May 2025 at 04:15, John Klos <john@klos.com> wrote:
> Should Linux maintain a 32 bit platform that has alignment issues because
> programmers make bad assumptions?

Linux (the kernel) does maintain it, and bug fixes are backported
to stable trees.  The upstream kernel (outside the arch/m68k dir)
has no problem fixing whatever alignment issues that pop up.

> Your argument is that ABI breakage is death, and that projects and the
> world are better when we tell people to fix their broken code.

"we don't break user space" is the #1 rule in the kernel[1].

> I agree that ABI breakage is a huge hurdle. At the same time, the ABI will
> change to fix 32 bit time. Is there any good reason to NOT switch to 32
> bit alignment at the same time the time changes are made? I can't think of
> any reason.
>
> So can we all agree that there's no reason to not change alignment when
> the time changes are done?

According to Andeas, here is no change to be made for 64-bit time_t[2].

[1] https://lore.kernel.org/all/CAHk-=wg-6jYZ=bJWdyBR=n8QOfwHTZZdzSUUPgFW+NGCV-pe2g@mail.gmail.com
[2] https://lore.kernel.org/all/87plff8p9w.fsf@igel.home

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
