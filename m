Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD11C34CDE
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Apr 2024 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712565188; cv=none; b=Mb+2fmpE2LpDDLJvqAetPBeiAL7ooAWSXr6EOZFM/eOmDYfzTqP6ctua9VcYr6klNixnSzr5BOQKe79iyqnbgquneuZEDA4DtuQhuHBu/D6a3PBB1vfPlU5bLADFfN9vfucMntJ4H6O7ZvYDV1VYuO3G62Y6KkdlS4mwtZ8KdDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712565188; c=relaxed/simple;
	bh=qsWHvJLZoBirAJa2z/xDxSXcE2fWSyxa1yYwt5wP1MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLm3pf9/Uwza6eih546paByISDIQTLv5WR/ALX1L+v6au50VrOPghTDpS75r1Y6+RMH/ILihoHKM2iPjDRBinMJxSPzE4Leb4rBmRn7y5GKqpW89t6bYUw6ZXcnCBLv4fpuCnR/TFyZGxBVJban+OwdYVj82WndM8TprHUheJGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so3056109276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Apr 2024 01:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712565183; x=1713169983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bnKadFFQKfZtqlQN85uKX1QN2funm0jGKmok0O/bf4=;
        b=DKW0NwNyhvMscnfX39mx8EyagtG5tkTMt0QJKyHjkUXvz0gtA4yjd2ZTilNdXmO4GU
         MR/OQQDHmCEMn2fjVqaXiEne0o2nTBbJoMGGv8hfz4EHSX2dWN9zWiLvXqXXkbIrsY7f
         WjuOswZPR+N7MUSsLuXV7IW/rkCfGaYYokv1Tkl2k26o/d37q0dQSft2NSlOnXbhTvhu
         KQuSivWIO6yhKrRi91SCLONShiDYYkWpzrVmio0k9vBjg5U6GHGN01rT2+deqk0fh4oE
         1nh8LBaOwI0siqtC7Yt4HhUYfO4MKMopANwgUBNLCvRy4mlbIjTHTQFTiAmy+3EKLkQm
         yvpA==
X-Forwarded-Encrypted: i=1; AJvYcCWqcLEbMMKByGWR+8cP7pQJ0FYIwki1rHwnUa6+gSC9Uz8rce9nVqvtdYrw7SuVgKvgAKI0P68j6j5k3BYZzN2OE7JGK8/MwyPI5G96hhjG
X-Gm-Message-State: AOJu0YzzO7wuNd+GguJZ6vHd82yorfM4pkOfzuYc4EKo6koxWz/0KKPV
	dSbr95JsZJ6u/AYvaPyPbxUnb1lCDNtop1NQwx44Pj5JpzWX9fSKcdU+hwerWYg=
X-Google-Smtp-Source: AGHT+IGRl2e7ydaN+kVw6WLJqW/6hOoLfO04VYSN8iViJCn5BZcld1AVz2rOnWUwol/4zQ1O1IrfAg==
X-Received: by 2002:a25:2904:0:b0:dcf:9aeb:73af with SMTP id p4-20020a252904000000b00dcf9aeb73afmr5709257ybp.2.1712565183453;
        Mon, 08 Apr 2024 01:33:03 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id q185-20020a2575c2000000b00de0eaa10ebesm622395ybc.20.2024.04.08.01.33.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 01:33:02 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dbed179f0faso3725897276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Apr 2024 01:33:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+Onq40juwTo74Hu8it7LwI2yR9DH755ORQmEDXoI8/K8R35xFO00/E8rTiQ32NT2IEiRtvCFgZ+bMgUGXK0J6zYkYn6sEK6BGnqu+J8Pl
X-Received: by 2002:a25:ab2f:0:b0:ddd:7a62:59b0 with SMTP id
 u44-20020a25ab2f000000b00ddd7a6259b0mr5993867ybi.15.1712565182435; Mon, 08
 Apr 2024 01:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
 <87y19s7bk6.fsf@mail.lhotse> <4bddf8ec-97f1-07f6-9c0a-523c102c0a1b@linux-m68k.org>
 <87v84sbexv.fsf@mail.lhotse> <b1553164-18db-4f5c-b1a5-28a393d64941@kernel.org>
 <3adf561b-2d6b-47be-8fca-2a26ee738670@kernel.org>
In-Reply-To: <3adf561b-2d6b-47be-8fca-2a26ee738670@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Apr 2024 10:32:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+sZCUs7a-z07y-27t7RFqRg6y8M98XqExLy0qU=aVOA@mail.gmail.com>
Message-ID: <CAMuHMdX+sZCUs7a-z07y-27t7RFqRg6y8M98XqExLy0qU=aVOA@mail.gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Finn Thain <fthain@linux-m68k.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Mon, Apr 8, 2024 at 7:37=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> wr=
ote:
> On 08. 04. 24, 7:32, Jiri Slaby wrote:
> > On 08. 04. 24, 7:29, Michael Ellerman wrote:
> >> Many maintainers won't drop Cc: tags if they are there in the submitte=
d
> >> patch. So I agree with Andy that we should encourage folks not to add
> >> them in the first place.
> >
> > But fix the docs first.
> >
> > I am personally not biased to any variant (as in: I don't care where CC=
s
> > live in a patch).
>
> OTOH, as a submitter, it's a major PITA to carry CCs in notes (to have
> those under the --- line). Esp. when I have patches in a queue for years.

(Good to discover I'm not the only one carrying Very Old Patches ;-)

> How do people handle that? (Like rebases on current kernel.)

Keep them under the --- line in the actual commits, just like your
changelog? All of that is retained when rebasing.

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
