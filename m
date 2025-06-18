Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8F1A5BAF
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240602; cv=none; b=gB+/0A/YWnKM5YZebr4jUZLauIlafrL4DyLBJi9E4Kb0Wx6RTDGnH0gfgVnoLj6qD5vScpIA9Yl/M8ZUCKHstcvITCRN5v9sfYH/PAAja3S1uFKIlPF7Am1BB1tO+u90LrUxTxGQVz1UiCBumy93FRRkAYcO2D9fQ9u3iD2ncnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240602; c=relaxed/simple;
	bh=ggYix5uWcXEQUtOP64zbAPJ7D995et8i4H5867DhSWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXsX23DtkVmvC6T8+HFQQ570Pgg0S308/maEVvG0tND8Ila67gnMlpeLtvKThk59lrYjZgGSjiWf4B3+p30zT0A7dVXMIlWpveY6NwkItccaqMWBn62tP2gh59K3gHQ+vHjo0G4jzeQaPXxy2JRAaypLmJx3HZOyBhxvhnBjJhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87f74a28a86so1061582241.2
        for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 02:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240599; x=1750845399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkJ0MikksOBJOeYmSOMr9NVH6dfSp9Kh08IvCC0i0js=;
        b=a+GF7UNNNFLkRY1IMMPes7ZRg+GnZpOaFJmd3oExBW5TvqWFt7YrdHdMREzR1MIcsi
         ZbqYj4Yc15lGFtkZOqZNpbQpUUNgK+WvCaVJA6Gr+1eaOXrmx9+dxrhrwfFaBzBPjqoU
         oPjINFKU5rOcyfdh1P84B5+BFNC9fTWyen72FgS2fLGMwlHW8Iw+Z9IhFQY8rl8p+NoY
         74el1LD0C/h4A4PW1ARxp2Q8nL8rIz7iAhXjNMBVT3PLMAjgHITP2N25+I634B0vfzvg
         RWO1cq2iETEUi92qOalSPsnpKnRw/5Nsz1DurxaRn2Q2OsDjtdqlcv0QmYw/JZe9uTeC
         8Rmg==
X-Forwarded-Encrypted: i=1; AJvYcCW3qmDgm17QBqQZ/+QRVKg6rZy6SvXVjpf/Ueb8xeEE33G50OieK1LDsficG7VgZV5AumNnwv3ocrk1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1jCjTA5FuiinuuBosO1ccHaRn0/4TMAzVvMTM+2vbMXCNq7l+
	1s/sASyQ/HKF/e30/+GtALUdkYQ41rbzLg3v/cZUP6XIxv38HP0XmuHsweorUpCf
X-Gm-Gg: ASbGncsTRwFjgXd2jRcdIZydVRDIi9qz4VGqnhKvExJdJLmKLZ02R1hsaD3vz8KKdeo
	Yh7d+MyNXVA0++BJQISxwswAvj7PItSbySXmhd9W+nZLYCOzoPodrR8xTQPzzvzII/Y5hEOVWq2
	U3N7gr8xHd48r/BxIERtfwKQK8KjSvUT5wvaxW9I/hIG0NfWrZ16A3sn8U1Mbsv1UJk3KxhB/jp
	PccHoC9gK+vuic0ZiU1fHa2vU/VIKrF11ftcQu2WMjsso/PP40T+jdFHJueRSH/IsUX+yRP6/jJ
	BNCrKEqftjRQxVS3JFKMMOAAOam+oPU6et5EaEN+XBW5cj5fblQT492h1vQNOoWv3K2oZEjVwl3
	WixsJLdQkITcgW+TOCprwkiqf
X-Google-Smtp-Source: AGHT+IGM5fUf2ZvU9pFFoBHTdvjROPzy8/tYu7W/z+2eMi9rtxVY7uGp/un9osTAsD/EEo9LNQCfFA==
X-Received: by 2002:a05:6102:549e:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4e7f611aee7mr12595182137.9.1750240598914;
        Wed, 18 Jun 2025 02:56:38 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e6e21c6fsm1915100137.12.2025.06.18.02.56.38
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 02:56:38 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e7eb3fad4fso3537309137.0
        for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 02:56:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1roqwWm6jhCtJ51+yA5t1AhYuGHuwz4mku+J+rBivEsmEbmaWaELU+bWn+tPp0nQQ5aoaMBgDA6Sd@vger.kernel.org
X-Received: by 2002:a05:6102:3e25:b0:4de:ed21:480a with SMTP id
 ada2fe7eead31-4e7f621a390mr11803515137.25.1750240597919; Wed, 18 Jun 2025
 02:56:37 -0700 (PDT)
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
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu> <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org> <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org> <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org> <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com> <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
In-Reply-To: <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jun 2025 11:56:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
X-Gm-Features: Ac12FXwhg72vdbANparUSSf2l6JmmhdcXDJiKwTq2TTpm3S0EDP6VxhBwCgPuuA
Message-ID: <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Wed, 18 Jun 2025 at 11:49, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Wed, 2025-06-18 at 11:36 +0200, Geert Uytterhoeven wrote:
> > > I only know about Gentoo and Debian and both want to make the switch.
> >
> > Buildroot? Which is probably where the real product users (using Coldfire)
> > are hiding...
>
> Coldfire already uses a different alignment (for the stack):
>
> /* ColdFire and fido strongly prefer a 32-bit aligned stack.  */
> #define PREFERRED_STACK_BOUNDARY \
>   ((TARGET_COLDFIRE || TARGET_FIDOA) ? 32 : 16)
>
> It's instruction set is also not fully compatible AFAIK.

Sure, but you will impact it regardless.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
