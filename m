Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C11B87D9
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 May 2025 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748260308; cv=none; b=QY/PusGAvUXveKgh/uvSEmJf7VN7w5t/S2umXajQ/JBZ8Yi/Yl/5aSI1UpON0haREzT0uYr8mgEhor4IM0NZH2k+dyJ3gKsRtu5Q76d3ZjLW3GKTBvUQLKDZ/V6Ubl0Nv5ocgvalAdz8kKZ/mcF7p/iGhsHfgoEiplg9YEn4ZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748260308; c=relaxed/simple;
	bh=eVe7gzDvYkF/v7+yXapTB41J01zj8EULcLXAJYEXPmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KoKFAJKoihY+i1F+oWLJAW3YlId+kE1BiTesnoN8I+fvEshOchl5m89H0kUcaFIKUIl7iFpFBllrZfNo3qqAmv/L2ujHwA/40tIrSUxrOpo1URVWJWK5BL5/aIysYwiSjj3TShQK4Pb1EVX9Dy/clhKHcVuCL260n0jq+kOmIqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wu5vHtVy; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wu5vHtVy"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5240a432462so1399680e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 May 2025 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748260305; x=1748865105; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk7I/TjZus1WfjiLul9K4l43bV0WtVtb36G6wrfsiH4=;
        b=Wu5vHtVy7/8fK22/q0xVj2GbRfd3rRorzubjZgvqipQrxA2PoZ5WiTcZkBUw6yX8jI
         nu1U/0nLa2/4ZzuE5yGkyM1anDHMt2kasIzfZLpPXbzdb7Mtm2YjZMwhzUxMda4Mm4HT
         7nw7Cpqb5kh4HDdbYccVaDf3rEJjZkopOXAv43mEYLUm6Q27knjavDu+lAIAzZlhuw+k
         82WardQ+WzW65GypTsVpYAkpwMYHI5zsZK9P74vfNtFqbNFZIVRkxs555tSYXUQ9tNAU
         8h3OipYDrmxzva91aq2Wn3LhU9DTJ+Nc21wXlZ+/6nZ8CtQ+ugnseIk42KKHWFO+YMOv
         a/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748260305; x=1748865105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk7I/TjZus1WfjiLul9K4l43bV0WtVtb36G6wrfsiH4=;
        b=KLJLrCj3Nly2lj2nLF89ECzt244QYylAyA9y55yn46q4VYEXBN6ALEt+GSJzQfNl8X
         t0Wd6Oenumr0zDammsXcIjEGLxAwAY1DitJW1AudGQVk/nvupyiQyu7yXoQC+ZtvQLsP
         tdStbg8N32vR14q4vcFwxBtINqGZQ7Lo7l0iFbxhPE0yyzt7m1HMqIgv4pu78HwxPMaD
         7eNonDJ0m9bTNnhKt7VZupFBfGe4M4JKOETExSqlxMHUM7F467W3sLRqc05SZxVUsynu
         ikVPZ6FE6/+g08tLTfgH0V2z/IiPNLh+4/ANDa/sPHNDQRrXiup1QGNhs8+cmRoh8vXf
         hQQw==
X-Forwarded-Encrypted: i=1; AJvYcCWZrocNkFmdi0HUmB+zH1aEfZnZXCuRyKz0qAYtNJmIczX+tD989oPePbNo2+egKOZO6OoL0eJYq8L4@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyPyLCNdNnnHTsE+nY8okff2Ek+17QYJ6h9Iq9zGdRC4F92REbt
	wFHPgLAz9FdRcTZQhX1/8Y9PHVa1grWUsh69U7ARMwq7Dyr3mXq5YOue7Ojp+VcfGLfAkO1hHYn
	z/YWjQkaFthPBeZut1HoR49rDCvkK6AQ=
X-Gm-Gg: ASbGnctuw43D7hKLXWqxcfjyXiiTbHJ8tDTego9TfXVzPmUahFelmwjoLSExHSQq499
	kfb22GFghaISvmH4MW+I4kAjsor/welF+M/hq9CRfFoR2dYm2EmFRppBo+1NaK8BH/QSAg344QU
	JlJZY+qlUyfkpV7u0O4ykVXlSdFyeBxoh8PDwKW+LurNFRyjJnqBmC9EqDmmovNmZJPg==
X-Google-Smtp-Source: AGHT+IEJff5k2A8k6P3iag0uEos2mJDRIGeS8NhKRZjyRef4636hA/5M4HMNpMmn3C4cZE82rze+xiVAJ/76kykfQIw=
X-Received: by 2002:a05:6122:2007:b0:52d:bcd1:ab55 with SMTP id
 71dfb90a1353d-52f1ed6fa19mr10025557e0c.2.1748260305247; Mon, 26 May 2025
 04:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325155613.352680-1-p.pisati@gmail.com> <aCSBV_L-NcNX4n7G@akinoame>
 <30ba2e36-8957-4dc0-a5d7-85ba71ad0a59@kernel.org>
In-Reply-To: <30ba2e36-8957-4dc0-a5d7-85ba71ad0a59@kernel.org>
From: Paolo Pisati <p.pisati@gmail.com>
Date: Mon, 26 May 2025 13:51:34 +0200
X-Gm-Features: AX0GCFvO8Va9CeULMkFesSsZFw4wit0oh9MQ_2DCVFRYVjrkbWKkIl8KYMha6qQ
Message-ID: <CAMmgNdZ0RT+GTrK_mmeG3d=Khtck80gE9itrjSQbOrtKB=_U2w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] m68k: pata_cswarp: Add Amiga cslab ata support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

any chance you could give us an update on this?

On Wed, May 14, 2025 at 3:38=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
>
> On 5/14/25 13:41, Paolo Pisati wrote:
> > On Tue, Mar 25, 2025 at 04:56:11PM +0100, Paolo Pisati wrote:
> >> Here is a driver (and the subsequent defconfig change) for the pata/CF=
 socket in
> >> the CS-Lab Warp series of Amiga boards.
> >>
> >> Changes in v4:
> >>  - refactor pata_cswarp_data_xfer()
> >>  - ioremap WARP_OFFSET_ATA region
> >>
> >> Changes in v3:
> >>  - suppress a comment
> >>  - properly return ata_host_activate() error code
> >>
> >> Change in v2:
> >>  - fix style, remove duplicate swap macro, driver version, etc
> >>  - rework the zorro attach mechanism
> >>  - remove the unnecessary zorro ids refactor
> >
> > Gentle ping about this one: can i get an ACK or a NACK?
>
> Sorry, this fell through the cracks.
> This looks OK to me.
>
> Geert,
>
> Any comment / ack ? Or do you prefer to take these through the m68k tree =
?
>
> --
> Damien Le Moal
> Western Digital Research



--=20
bye,
p.
