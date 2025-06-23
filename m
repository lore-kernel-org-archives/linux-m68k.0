Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D641EEA49
	for <linux-m68k@vger.kernel.org>; Mon, 23 Jun 2025 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662829; cv=none; b=n+ODaJJIcLtfeQsT827JIdqhCA46TzKcVAxdevP18kBRYkDq6yyL+NgKbT5YOFL9+mSLDYWkc5dONGx9WfdlQ2NLChm0aSmnxYgN0aw0pHR97C737ZwdiaNPZc8fU3pZoprKhYqGaDCKh/3r7LLXRp2CGJpjVSdEDlbxRWuEe7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662829; c=relaxed/simple;
	bh=+Vdh8cMiD6VkBWevSRjdL9dx8cxr7S/RSU+f8BdT31U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vE0w09IebTmXkGwmLRhhtAOFETL/BJoY6Eb0vUI7J1tid2fW8gtzCpSPAtZMKSJHG5RNBRARVEmTl8Fz9rRbkCcqgDTWSdHyJb6heUdGhP2Wq0K/9y+ZS0X7jho2n4MSmkevnabqHycfFseFeup4wVXoOx67mKT6IiOkPtlfcFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-53185535ed9so2695867e0c.0
        for <linux-m68k@vger.kernel.org>; Mon, 23 Jun 2025 00:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662826; x=1751267626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hfYe9yesrl93KTAodQIcxrHjuaH+j/MZIHfx7/FasA=;
        b=FQ+eqDKsCdS9lcmX8EcrlZSP4Omc5CSP8SsdWM8xxOeRO0XG0P6OlOPNmQD+X0miRA
         6qAwc9vAHxRqPVsC3iJyHWsfug8QbabiWvi97wpNxqsePHzEpKMMP4KVI8wUAZXr63I0
         P0D/AbHDd/FSUTXbiHc7uHzaVRV6r6Hapv7OncZ04+8Mifd/AA0riebM1GHA9+QGlNEN
         65bDhFYZ+fBhTKlyyZ6sbkYR1x38HrpJ9VewR9PAM+am9MhFyw2ha+gq6KhPo38o6RmK
         gyv7y+HsNkTD4PuLitmu2XqxmseRLYHFSXyGiUUPN/WWaiR4oabqCnC1DvipgCvBV6Bi
         +/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAI9LK8fwOd/nF6CivW94Rg+dSP7HcmrFwvCdkZs0jo5669WzGi6oW8tDWcW9HtJWYDNbqjTLvoweQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzV5cbkLB3DIzFnIWb5fVb4aQnKCQy1Vn1Jtt1juVio04KGP/xS
	AH0JPE3KbprpVzkHaNgu68MuZtV0L98NLOE9CvKlCk3dxfEV652KrZ8bwjsguzSI
X-Gm-Gg: ASbGncsPHn6sjoA9h8HJN7dmvjsmZyBiUcKBmLXyz4dNsVkR1EikCbmyU6SDSYRlGOn
	ynjBUKYq3AI5mY4fFOZBVY3j4JYf77UxCZodW/TsKi6gWt9p3hFpZpYmnzyRdYmEjbrI0wx7KtP
	HWKor5cMn8RZIRSy2Q+4eACTYcHFOti/g7kEuoX/qmHrUVBYCGNk1iTL/bGet4IbKlFibFO0jLP
	vmCBzIn3bBkHoKDZvBxOHdhrbIHhqgjq2N06trC3Zeg2b5oIYmg5YNDMUrV3TKkFFVhLYnfJt60
	qj9abxgJvMqlmR26bx3YPMjFsDcJKwyrMB3ljHHLeR/nys2SWtcp+sogzFrl+8ZTKbHOUKW+cjN
	KQ6twkzIy2EgRikp3b4RYO10o
X-Google-Smtp-Source: AGHT+IEpnRz+maHLwn2Ok0oo8WX9+/dvk/hS/LwLXExZG864kdGwxjcVFYqlT8gqbb00ADq4I35Xyg==
X-Received: by 2002:a05:6122:698d:b0:531:19ee:93e9 with SMTP id 71dfb90a1353d-531aeaf1595mr6774172e0c.2.1750662825613;
        Mon, 23 Jun 2025 00:13:45 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab20480asm1163038e0c.2.2025.06.23.00.13.44
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 00:13:45 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f32826f22so2823555241.0
        for <linux-m68k@vger.kernel.org>; Mon, 23 Jun 2025 00:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa+FGxSUQqMdI5p0b5+WJ8h8n3PZ2UPvwN3NBRWjODsrU1bQoiTaL0S+YUa2cuZNHah/bb/JfbJB3h@vger.kernel.org
X-Received: by 2002:a67:ba04:0:b0:4e9:963a:a42b with SMTP id
 ada2fe7eead31-4e9c6a7cbbbmr4270611137.8.1750662824771; Mon, 23 Jun 2025
 00:13:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org> <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
 <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
 <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de> <17105089-d9dc-4a87-b531-e47989aa765f@helsinkinet.fi>
In-Reply-To: <17105089-d9dc-4a87-b531-e47989aa765f@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jun 2025 09:13:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAi2Foyo1mfQB3DVzhkWCGb0_EZ9QA+cCtp-UodWs-HQ@mail.gmail.com>
X-Gm-Features: Ac12FXz0C9h1Nggu3zZyvfJiGqXss9SUDRyGT_MDP5AXVDkJEorqbf5nyXXP1fk
Message-ID: <CAMuHMdWAi2Foyo1mfQB3DVzhkWCGb0_EZ9QA+cCtp-UodWs-HQ@mail.gmail.com>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
	"debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, 
	"linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Eero,

On Mon, 23 Jun 2025 at 00:13, Eero Tamminen <oak@helsinkinet.fi> wrote:
> On 16.6.2025 18.39, John Paul Adrian Glaubitz wrote:
> > To summarize:
> >
> > - the ELF header provides provides the e_ident and e_flags fields which could be
> >    used for identifying a Linux/m68k system using the 4 bytes alignment ABI
> > - MIPS uses e_flags for differentiating its ABIs
> > - PA-RISC sets e_ident to 0x03 (Linux) while every other arch uses 0x00 (SysV ABI)
> > - qemu-user needs to be patched to deal with the changed alignment (include/user/abitypes.h)
> > - the kernel needs to be patched to deal with the changed alignment (arch/m68k/kernel/signal.c)
> > - NetBSD uses an emulation layer which allows 2 bytes alignment a.out executables on an
> >    ELF system with 4 bytes alignment
>
> So Linux could eventually have similar emulation layer for 2-byte
> aligned ELF binaries (I don't see point in a.out support)?

Support for a.out was removed from Linux in commits 19e8b701e258701b
("a.out: Stop building a.out/osf1 support on alpha and m68k") in v5.18
and 987f20a9dcce3989 ("a.out: Remove the a.out implementation") in v6.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
