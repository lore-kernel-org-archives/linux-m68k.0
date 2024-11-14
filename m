Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0919939D
	for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 19:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731612778; cv=none; b=T3suX3ecllj2GKJ0Z9ldK+KQnDeLSN9iqEcOSEXFOLkWVgHwBvq1blvr61YwhFpGji2hRP9MC5aR3lqrZFM/OWbq2AFX6CLCigR17ZbLxO9zhA12Hk8sddJ50h6ae+Z+umkfMRr5/zaPsbaZ2zlUw8pHhJnN9Afd54fuRLgURDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731612778; c=relaxed/simple;
	bh=6P5u7p3egAHXwx66Oa00si2BkwrYLAMoClc4sNtGrew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrfUawksUyhRXy3swZzfREjUv+2Jp0E00Yef6VkX9Bv8xVlUsifnA6os0Ed7i3hDv6OWYJ5RbFJH3n5Kk2AMABLu4suEuWA9xY3da31av4Av89Y0eMVhYo6lqvNpt9gNjyxJeTeFDDV+XfsF54FwOaQ/NF028mckuIBIhhVpx5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e8063533b5so9747177b3.1
        for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 11:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731612775; x=1732217575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75wSx45t0ZrjiC0saUJxzg+v6DiAeumn7W94GPAWL44=;
        b=QOftj1vSGHS/yqG9N7uiQkaBxGHoVTmQZtgNSHp421oRfLh35MNfpbFt45zXx5UJK/
         X+bcZnz/75Txx0IC4XLZbtTkclqwU8ql5vRPKXcYa2at0iIOxdfnqwh/8IjQq/LGA+hW
         laXRFyETBKMoms3eHJHHd02lSJF4tkSTzEVtvlbJIAKAYrTkQSAPriF6yRfXKOK4Hx4V
         O5qhjfekuLPJawNCWsk1rLPYwlN/jjTYqdgtMj7XE3spOlEY/4CvzIt4/oUArcV2meBk
         bGp4/DOTlZ8tDNXiWCGvBprahwBHyQrJJJbwR14lUgT9L0DtG/L/ttGt4elbv6X5ANGK
         jARg==
X-Forwarded-Encrypted: i=1; AJvYcCVJmcTkVCB58Pr7fyyjFQp8VYv6OjfZ2T/pJFzCLNFu+0m0ZGHlUwZ6M/XAbT3CSzM+MMl2e0TlzCoz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1J031elH5zIKwkG9+wULhjaOQaVE4BKXbPxhRTWRiwmWb87xe
	94MQ2sh3Y/4QaoeBGJ1adVwmXzmVqwEIhKmPmyejRE/Hx63B9fgaqi2Tk0VO
X-Google-Smtp-Source: AGHT+IELk3ytyRmtW+pwoR+aJUJYiGUeDCFYpLr3Htbpx9ZTgUoNOOji85FkUVXHykKzh+HPAqnNkg==
X-Received: by 2002:a05:690c:19:b0:6ea:6871:f6a8 with SMTP id 00721157ae682-6ee55c758c7mr1264677b3.36.1731612774688;
        Thu, 14 Nov 2024 11:32:54 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee4404a092sm3864787b3.52.2024.11.14.11.32.54
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:32:54 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3824e1adcdso99001276.3
        for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 11:32:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNFtZx9BYrZeDFKVkgv5tqRZnQ1qSvpf6tw9Vm2jaJ1blnNDx0BMtC0EVieMnmeT5vQMOcOjhncmxN@vger.kernel.org
X-Received: by 2002:a05:690c:6608:b0:6dd:b983:8563 with SMTP id
 00721157ae682-6ee55a74992mr1604167b3.14.1731612773878; Thu, 14 Nov 2024
 11:32:53 -0800 (PST)
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
In-Reply-To: <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 20:32:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVfnv64Xs0Rv+dwh+rD8OM5HV70JLuemzB2MvYyA=vZA@mail.gmail.com>
Message-ID: <CAMuHMdXVfnv64Xs0Rv+dwh+rD8OM5HV70JLuemzB2MvYyA=vZA@mail.gmail.com>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-m68k <linux-m68k@vger.kernel.org>, debian-68k <debian-68k@lists.debian.org>, 
	James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
	Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On Wed, Nov 13, 2024 at 8:55=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Thu, 2024-11-14 at 07:36 +1300, Michael Schmitz wrote:
> > Development isn't driven by memory pressure anymore, so code bloat is a
> > natural consequence.
>
> But we're not really suffering from bloat. On the contrary, both software

No, we're not. Kernel images don't grow ca. 25 KiB per kernel release,
and web browsers still run fine in 16 MiB ;-)

> like systemd or Rust-compiled software actually use less memory, not more=
.

Last May, systemd in Debian/sid required me to enable CONFIG_CGROUPS and
CONFIG_DEBUG_FS. Last weekend, I had to add CONFIG_USER_NS.
Yes, that's a small drop in the kernel sea, but all drops count.

> > While Debian was the first Linux distribution to support m68k, these da=
ys
> > there are other options, maybe some better suited to low memory systems
> > (and I'd consider even 256 MB on Amiga 'low memory' ...).

How many m68k systems actually have 256 MiB of RAM?

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
