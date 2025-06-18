Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E7283125
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239429; cv=none; b=bYAk0FiDEN+mfWY9qECjRq2rbaR7NRdrMQ71Vg09QsrQY+ASCpgEXduT+nTZjbk+mr+nKp9YjiGU0xzdA3nrnqo0GJEcsDX53HGxOSPkKkW5PQlmn9JiOiFTSeqibg/n1pU98uQnP6+KADIVwyisVrkPkKNp511oYS88Orx8Tcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239429; c=relaxed/simple;
	bh=uzXBEaS/iCbYv9uYk3VAqfe4OzOidab9n1uLnU7T4cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELmaYG8exU8PwNjTqH1EwNhlUDVE0Bsi9Yc0+9b3rkYMREX8nhro9HWSnWT6vQHM15+UsIAYb+9cF94t7QeBBBU/S+ZImf5NEbo0Zk1P8dGH4FyYBtq/0pgAZJASbIUyyqVduOnWoraflldsSF/kzYbaRtnAdwxh4pdIz/PO1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e7e5b6207bso1515098137.2
        for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 02:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239424; x=1750844224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCmx4lAsWGOeZi6j4cfjAB5ThcgYcIf1Q4vTq5y735k=;
        b=tevZd/4Qb/nwkbKG924ipTzC0sqXW3j0YmYbqTn4OpAMwfU58VPYgvwGZgKsk1tJcZ
         86O7pMA2pTfy1iTeNyh7nQdIlYTpIbXqKWdtbOQldv10r53vigryNwq9pv6SD3nZznfA
         twcXhODht2LrY1ZJlQ5mQWNU+TYdM7C4DLEExj2qZdtKwusopXIY/SMqAnx35Uh+lhcg
         e7s8PiCvelHfwdlvea1fzk7aLKbH/GSjHGj5ODfTbhia/TtWCWcIjhghDYsQH4wJu2as
         ltsB/uY4ylz9PWllJfq9x2dhAC+Yh1ut5WZoon9VCKxHal9Vv8Ziqq8sXjDHle+Iim27
         APjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4yt3l3pLXmSLlEI0B7K0XbTdE6YjmZCn8yxaRwQkDtQnOJoc+myw25vzbRvLatLOPee2vudS+WgJZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ1v9THv39Mdy2ftIB0Iomrndcildi/DPwt7q66rglUfwjVDbf
	YmnaFz3W7s0VtffYT/yPydZNMviCtZMDJIbhiByORHn9k/u3GK0xBbkNSftJ+EWP
X-Gm-Gg: ASbGncujuTage6odWC7xZXfPhsxB0qTinhMxs91IGJQutero8+g3g3EUkAWoVvH3rSZ
	VvC9gkfPaOsKE6lXXaS4GMHCcE8P4DEYI9bYaabLXqgBBK8ujmpa/oUxU5apjfguROzNeF5bNKF
	fsfI9FFPpeqQ5DM5yoXuwMVp5qxetu4/EW9EIz/WdsHUc1/hU52fvUPkTf5joac/wNjhouTD205
	STCBWYKXTuDgfoy6Ekx5F/z9igunz4YY/KcS/9C3uj2KBVzUTvbSnZtb069/dZ1myXJ2yayZ+/Q
	0dJyvmAhgJuYb/oORSGro2KxQw7k6AJwJYEFjEp3JEmXkS0aiB48Tm84dU+4Bpn8YN1dY61MC4e
	zI9oT4ys378GWWobcCaN9bVtc
X-Google-Smtp-Source: AGHT+IHl0pM3XPVX7HbTpnINqsicbRt/Z5BFeJ6Ff0o/u1IYQxYF8nfvM0biQRK9Y8IU6G2/Zu6rwQ==
X-Received: by 2002:a05:6102:38d4:b0:4bb:eb4a:f9ef with SMTP id ada2fe7eead31-4e7f60ee00cmr10912633137.4.1750239424610;
        Wed, 18 Jun 2025 02:37:04 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f11b25572sm1866406241.1.2025.06.18.02.37.04
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 02:37:04 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-880f92a63c7so210544241.1
        for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 02:37:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQYE37deo5h7v9iviqqkP63DACFxzQ1NRKDHo0UhlIYcpw5J+qseXUXkMPpkeYi5EgjczLvTkFeroF@vger.kernel.org
X-Received: by 2002:a05:6102:449a:b0:4e7:7787:1cf8 with SMTP id
 ada2fe7eead31-4e7f6110b06mr11625704137.7.1750239423849; Wed, 18 Jun 2025
 02:37:03 -0700 (PDT)
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
In-Reply-To: <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jun 2025 11:36:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com>
X-Gm-Features: Ac12FXyni248JlrAhV1cQbV4teNjzjxSUX3ZdEHz6NtgFL7xHUaIlbv_lTsgcDg
Message-ID: <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Wed, 18 Jun 2025 at 11:16, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Wed, 2025-06-18 at 13:50 +1000, Finn Thain wrote:
> > > How is messing with a hobbyist project "harmful" in any way? That makes
> > > no sense.
> >
> > If your port was a pure hobbyist project, you would never have brought
> > your complaint to the upstream mailing lists, where developers have to
> > work with ALL interested parties and make the necessary compromises.
>
> Can you list ALL interested parties, please?
>
> I only know about Gentoo and Debian and both want to make the switch.

Buildroot? Which is probably where the real product users (using Coldfire)
are hiding...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
