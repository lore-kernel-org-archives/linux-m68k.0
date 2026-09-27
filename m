Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D172D37E5D2
	for <linux-m68k@vger.kernel.org>; Sun, 27 Sep 2026 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513666; cv=none; b=SNd2tmwYGQLIv9xB5aNmProFkLNOrZ9XdXYp2/NimUncRnmW+cDIkKycQH4KZg6+sgXps4ACPMLARnYk8L9BCnWBHGMFTMq0VAxZtvgrgezhl/LcRQ9XVxO/c3VwqqDGXjEPb7ktUO5cVYPXZaNNuSBD2lOCYcb5KQKvRAo/PFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513666; c=relaxed/simple;
	bh=R29nYsXl+c8dxLdHERPipnA1GSlpQ8/sfOCHja5K/18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwwzJx3YSSGApdG7v0DYYw6Fh2z1CYzvwtHRcU3GWK071+SQ58iRSYXePdeyusZH9w2nIfVys+47DiZVn6hU3OcXy1QFypdyfxaInV0qB5REbduaGGb3miSq5/D0pQg2sdEwW638+dQNPanHqUgZl/RwdkjY54qAHmMhnIACy8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso1508692241.3
        for <linux-m68k@vger.kernel.org>; Sun, 27 Sep 2026 05:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513663; x=1791118463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6eC+tx95ctGkh8odqe9c/1Mnran+7VtzP9y7S/y/PQ=;
        b=Lm37JqI3UfPrNvVmqHTEJlfMdU3cugeDWgl4xs1oZW1+BGzWYj39khUr9OCznH1dHu
         73gUer9Sc/XkbhD3RWG3WEh/KlPE3j//2BRkEY+ayF0AHXtnQ8u4P0tSKEy5pNBIrdBD
         V17brhlLLYfgEfdP/RN9uvzvhgNUz6lWySwgV25E1efZrSBxxwdDEj0tHYmU0DhbUovd
         ELylyzt3oynOIJdVEg5ZigKAH+Jf6SAkclIJuBvYFNDHK6D72ufOdkIbJ3wSFKa6fgmk
         RLcTft+yBKaUR/OhEW2zmBkOLpfkgc9raRW8yc2XoNRcCUka+C4JKkMSZ2zbhlgxSHf1
         21Lg==
X-Gm-Message-State: AFq9FYI/cziJdhHRwlXG/jw6r5d4zn8zh9n3+XFoQu0vYkVZffj4Kfzq
	+jqbtqyjFITCejwvVRIDuQMdJ7c4dweR6X1g/WIRZrORrwq3+w/vgTyhB3LUetWX
X-Gm-Gg: AYBFou3CP5XqWjW1y28PZ6VQh4O6iHIse48U7XGzC6uMdGu0WkiGNDk8p7EJTuuQFnp
	DaWNjUOYec0MNFILU9nJC5CbVAEk8tMfHLpJWM5jTxO61me6Ulw38Zsc870D/FlTwL36RzBXadd
	bHXfOP2HUw3ne3HvfgM26SiSHBZWpUR0Oh3zxfxu/f1NMdlZdB8u1q+XbuINj9KZrihRCi169St
	01yJEY4OX2/6hurm/2SzET7UeYUKyNhhIrboc/VyrKq8T0OYjURRpiOwHqSUxibvINZcG+BQBij
	a1YwW/vidmW0BeRLA9N/KHdo+j60APCulCHGH+9aCyhA6paO9L5SBHlpxmMK07OBFqB8DqnUY/s
	M4es0EUkQAy7UgSWj6Qy6ITnb1nAGep3ndMOj7TTlwRPDsIAL3v9691HgZSC+2XysQ7e428uTVu
	9Epv5LYW7v2hD3FPyqVrJ6vj+PJ0Hnfctf+RZoh0657EE3YGZXV1ojP9EJRABAN2+R7YnicxF7y
	54Y8eYnMgT3QIzVr4l+o6dyibZXZzfezoph8vXAz6jMoBM=
X-Received: by 2002:a05:6102:f9b:b0:7a5:2792:32d0 with SMTP id ada2fe7eead31-7af1ceaa02emr4463595137.15.1790513663613;
        Sun, 27 Sep 2026 05:54:23 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9af306sm5400441137.9.2026.09.27.05.54.23
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 05:54:23 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-790b4aeb66bso1157896137.0
        for <linux-m68k@vger.kernel.org>; Sun, 27 Sep 2026 05:54:23 -0700 (PDT)
X-Received: by 2002:a05:6102:3752:b0:79d:cfe4:7202 with SMTP id
 ada2fe7eead31-7af1cc9e29dmr4554958137.11.1790513662728; Sun, 27 Sep 2026
 05:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816073752.16656-1-schmitzmic@gmail.com> <20260816073752.16656-6-schmitzmic@gmail.com>
 <CAMuHMdWKqtNd1iGNsXcF6NUQjF6bZPp8YMPWB3y7++2VpwZd-w@mail.gmail.com> <CAN5rfbTuQj_EA7kNuNfNkTFadQ6gQTsPsf_XJkyQrM1CCcCMnw@mail.gmail.com>
In-Reply-To: <CAN5rfbTuQj_EA7kNuNfNkTFadQ6gQTsPsf_XJkyQrM1CCcCMnw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 14:54:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4oQhr2nNSN9-k01aUwDs7ubZJ+XFUL34N5AxMZKh8zw@mail.gmail.com>
X-Gm-Features: AclHuK8efz6R9uvPO13pcxH3TGzqAribY4j7eh4joL9p6otKFvCOMDDtGCgQP88
Message-ID: <CAMuHMdW4oQhr2nNSN9-k01aUwDs7ubZJ+XFUL34N5AxMZKh8zw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] m68k: Add support for Svethlana
To: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miro,

On Mon, 7 Sept 2026 at 12:53, Miro Krop=C3=A1=C4=8Dek <miro.kropacek@gmail.=
com> wrote:
> On Mon, 17 Aug 2026 at 17:14, Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> > On Sun, 16 Aug 2026 at 09:38, Michael Schmitz <schmitzmic@gmail.com> wr=
ote:
> > > From: Miro Kropacek <miro.kropacek@gmail.com>
> > >
> > > The SuperVidel FPGA contains an OpenCore ethernet package. Add
> > > platform device data and other necessary definitions to support
> > > this device on Atari.
> > >
> > > The ethoc module must be enabled separately by the user.
> >
> > ETHOC selects MII and PHYLIB. Do you need to enable any MDIO or PHY
> > drivers?  I don't have the hardware, just asking for {atari,multi}_defc=
onfig.
>
> The PHY on the SVEthlana reports id 0x00221513, which is a Micrel
> KSZ8041 (PHY_ID_KSZ8041 =3D 0x00221510 plus revision 3). I tested both
> ways: phylib's Generic PHY fallback drives it fine at 100 Mbps/Full,
> so defconfig needs nothing beyond what ETHOC already selects, and with
> CONFIG_MICREL_PHY=3Dy the Micrel KSZ8041 driver binds instead and the
> link is the same. So that is the symbol to add to
> {atari,multi}_defconfig if you want the dedicated driver rather than
> the fallback.

Thanks, then I'll go for the size-preserving option of not enabling
any PHY drivers.

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
