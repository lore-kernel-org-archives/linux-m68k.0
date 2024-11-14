Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80218A931
	for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 19:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731612528; cv=none; b=f+6PN+SJuJ6gDy9a0irq9jTvvGzpoWMBm6h4CIaMEdix/uqGCMkQXK7psOJapmKtufM6PTEKNhT7EyZ1Jv67DjB9sbPGCQiWunhhcL7ZjilhIBN1rGmsng4ax2jbwgZotxUAy2VkRNpvACdj1WznNt0TwITvIn6aJ9gNZLYrh0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731612528; c=relaxed/simple;
	bh=qgzXPWcOqOAyGdDVrQaTD0OsyxsnlA+ag6y3ARoUaS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEAxKlFXpfP079cozLrbpMOPhFFziYRqn0VcDZWxCVTuOa5lTQ6AFQ7zD4NGTCJqE2VPIlDNgByvqO9ZiR8N0lzWwCjXmF9oN8a481NCb2zWfMdT2MMbMtZP2Xa4dxu2oijg/4uGtK04Pwv/fm2b1DYkUYpGadx0gz0P9DXeUHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6eb0bdf3cacso7748897b3.0
        for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 11:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731612525; x=1732217325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t30NhxrrBfWn7xJF/iZfa38PvHvtzcPRMg9kiUwDeIk=;
        b=PKrutLtSC54QfqP+XBKHWVXL0xYJhzeSYRVGRPwErJhiupEB9cX+JWPJRpxVfHKQFl
         zIcaEfRvP2NJ8H/z3qP6kISju22qJISiyreyTxP9SJqX5YBwjS5iNSw4J6rC18jXL4Ad
         AJ+RPG09tr047JWlh/mDy+iqxgHzcvMUIVGrk5apCxc8OuyLQl0WmAx4KTqTERDKli9P
         X5qJAG1VUScGKuofVz+WZo9TtaZlCdyzn3UpeWcw0/DXuDIKrboHXYkL9GlK2I0xbJJ3
         JVuol5Bd5rMV4x7EmPGs2UO69EPf1JUhDyoPRzc0ILN1sQ0xtnUsTdlIvLawpZ9mjcRv
         FDxw==
X-Forwarded-Encrypted: i=1; AJvYcCWhMY/EOIgxWnS188RO5WIJYasKFORdKmoACSns2bJvHsrxMWRna3CbqMDz3I/N8Rs1Cr+EBWNtFC53@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgy5QvidKFZ2k/EZUygdQ2D4aGNYUVbRsIDsqOeNTQg5ulF6s
	CwxLk0N9r5Iq8YWR5BLlUMWTTNpvZmnWjyQG6WQpvgOo6rtroxERlw0lwJG8
X-Google-Smtp-Source: AGHT+IE3+jnDxfqPEoN9xS6y6YckGpEwdZfc+l7c0XT45ZW9/4+w+xcBX04123XYeo4ENSkd4jVEmA==
X-Received: by 2002:a05:690c:308a:b0:6e3:c92c:1d57 with SMTP id 00721157ae682-6ee3c53f1bbmr48087417b3.2.1731612525132;
        Thu, 14 Nov 2024 11:28:45 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee4400c6e6sm3906647b3.9.2024.11.14.11.28.43
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:28:43 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e380f90b04bso945210276.1
        for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 11:28:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2NE/1DN01t0CIJYvmPNf+tw2AefQRi5504BevSGP1j5dtHAXe6lEhsypk/5EIRFimydLOEADePKo2@vger.kernel.org
X-Received: by 2002:a05:690c:6e0a:b0:6e2:2684:7f62 with SMTP id
 00721157ae682-6ee3d317db2mr46992657b3.8.1731612522919; Thu, 14 Nov 2024
 11:28:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com> <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
 <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
 <f87a85b2-809a-44dc-9a61-24698d7888eb@gmail.com> <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
 <a8611762-5539-d6c7-8d99-2fdaa6a1caef@yahoo.com> <f5dd33186498e9ade40b5ffca45d8fabf04a3ec9.camel@physik.fu-berlin.de>
 <6503da97-963e-f0ca-4dea-bfff825b2c53@yahoo.com>
In-Reply-To: <6503da97-963e-f0ca-4dea-bfff825b2c53@yahoo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 20:28:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCTmB2q2FvK+wRrZrxEcuv-yrKzKeeO+pbKoAGREANrA@mail.gmail.com>
Message-ID: <CAMuHMdWCTmB2q2FvK+wRrZrxEcuv-yrKzKeeO+pbKoAGREANrA@mail.gmail.com>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: Stan Johnson <userm57@yahoo.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>, 
	debian-68k <debian-68k@lists.debian.org>, James Le Cuirot <chewi@aura-online.co.uk>, 
	Sam James <sam@gentoo.org>, Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, 
	Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 7:07=E2=80=AFPM Stan Johnson <userm57@yahoo.com> wr=
ote:
> On 11/13/24 2:01 PM, John Paul Adrian Glaubitz wrote:
> >>>>>> SysVInit uses a huge set of bash scripts where every action involv=
es
> spawning
> >>> a new shell while systemd does all of that in C. Compiled C code is d=
efinitely
> >>> faster on an m68k machine than hundreds of shell scripts.
> >>
> >> Yes, compiled C code is faster than an equivalent script, but scripts
> >> are much easier (for some of us) to edit and turn on and off than
> >> systemd components.
> >
> > systemctl disable foo.service is too hard?
>
> Yes, it's too hard. And if I want to change something in foo.service
> instead of disabling it, I'm sure there's a way to do that in systemd as
> well, but using vi (or nano) to edit the equivalent sysvinit script is
> easier for some of us. Also, if fubar.service is completely messed up,
> then I might not be able to boot into the operating system that is
> running systemd in order to use systemctl (especially on a slow system).

That's also my experience: when it fails, in 50% of the cases the
system doesn't boot sufficiently far to use systemctl.

But all of that is irrelevant for an alignment discussion...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
