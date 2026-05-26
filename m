Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBF6403155
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 15:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808114; cv=none; b=oALrBeQZkMcfkq6pTYlnUdypAkFAqrgPL6OM9fZ8N6olBE3xlWs+gVyYrgVGTNlk74XrfNDlMV1fmi4M8kXQ8iSYCqyAnSj1BKCkakmSNXOs7l+Yp9KXTCSmINKqiSRzyk/Ja5u4ouW41G6uKTjXwc/mW7T7sQq3GWke6iKP8hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808114; c=relaxed/simple;
	bh=yb+0omux6d1zyLgvLzeZABk2GNuWtKQ1yrpCoQCsmR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVEQ5T8vkZfY3QC9BuNQ6/g3mBAQVBqE6/AP9McvTR8ViUS60uLnCD6RbER6BNfyTdWcZS4J0LWyU535CRZcbWonTjPkYOyk4TprQW8qOCIcTzpcL7+mcd9JQUm2lO2JMLk0B0Jcc30z59amRa0CoUhppNOm3jLt3pVYEsqCj2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bdbcc6c4500so860642466b.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 08:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808111; x=1780412911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MLTPgXz6PTE+WNmbiors/d1TQS2Sqmrm+U6hNBea8hs=;
        b=Yfe4dM5CpOstzRiRGhe/Aq10dFKP1wK1aUfcB/rMwYFQpJ0BeT6xS+dn49OE7ehK2U
         wrs96Eyll0RyoDs3scP2L6vDB9j/17L0vP3Na3JjBWkPutWQuBAF4R3Js6zJjkTyLPwJ
         AKgwlU2BVPVjr2mWQ98+oPf2p+G3HXbR7TUoPRVw8uGY2vfg9byYz07sgg8jxOCpL/QF
         j4x/v1DIm4hmT05MptM1Mw1Q6ViB2knnPWvAZnvNP9p39blRq07zMvXo66Z5Nxs5U14y
         Ef/xJopjVuNLY0Z1HCOQBiXBHBQB4DbeaLHN2KRpmAYZzujfFacJ0FyHzHdOuTIeM3wL
         ZA0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/w+ERMslMf/gAqlbX9Etx8VnsTyZesR8PE/zWv/waqSGSOORwip8z7+VLX4N1ZxwDl4TL4D/XAwh/L@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxxa0pimRnJoEAg4oNp7+20sV9Sy6c/OZfI4BNVFEuzg7MwWdSn
	ncx+kkGrm3cVQUtiJl1niVOCJk6AP9q0kH/Z/wYe5SSiralCPLtZDsvYNKeGFKNJEDM=
X-Gm-Gg: Acq92OFSCy6lwIz9NfpzaQD+9t0qPcpLM2Ic89O+1E8vbjSz34ArWRWyZrdYswuWkTE
	/ll8QJ0dH7Dta0ud5IYGJfIxVvnDKVOKqYEEwuZqB1g6HJC5ORXtonHwObpX7/MNVCO5Efom+/w
	lDBQ3HpCHhKC+lAaRWnzMmkaYqTK+AyQmcZz91Vm1lfxfIvIkY+dLSbxlIFP7Z4vCvSoUp+Vp61
	ntaTSMdJ3rLHdMViRrgNniI/8QHFaMQq63LABI/Br74TtRuN8H8B3wzoEZDOoZCorYoMHpi1fnC
	QsIjvy3eqX8iQq4IdlVLl/zfzYwRlaKx874FLG5mVkirC4vTCU+uMgP5HjTWqPVIVkNS7TrQVgc
	+uN26u9YehLgGT3FraHz8Xlaj0WNB/r4bGSqnEolFwu6wwLEc6R9Wj7ot8sGvXoKw6QNSQdY8oN
	9YpkQ/f/G10cHxzo+qdbT/8Nu+qwqHOWkaJmsTzc/8aYbb6DKq1J0MXHpdQnj//ZrZgp+qBsA=
X-Received: by 2002:a17:907:d07:b0:be3:9671:3bef with SMTP id a640c23a62f3a-be396807ef2mr124930366b.7.1779808110515;
        Tue, 26 May 2026 08:08:30 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d6369sm506637766b.45.2026.05.26.08.08.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 08:08:30 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-687d82dd690so4866457a12.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 08:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8WyB27qdfi279BduKtBIv6MiC4enE9hRLQsR6SkqFP6CIggwe1FDl1LZsFbwMHNwMG9iAG/ZFPBqse@lists.linux-m68k.org
X-Received: by 2002:a05:6402:360a:b0:674:40c3:f047 with SMTP id
 4fb4d7f45d1cf-6889ca4520cmr9385916a12.12.1779807721391; Tue, 26 May 2026
 08:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 May 2026 17:01:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVoNg-rSV_hDcvi6KCosmE=SMcxUj2Y8fkoJ=33zMSXw@mail.gmail.com>
X-Gm-Features: AVHnY4KG1TJnpMipnk7rqdd9LGhhF-uK_MvXjYFynbh1jLKZ-eyBikYr9yO02y4
Message-ID: <CAMuHMdUVoNg-rSV_hDcvi6KCosmE=SMcxUj2Y8fkoJ=33zMSXw@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] zorro: Improve handling of pointers in zorro_device_id::driver_data
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Max Staudt <max@enpas.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Helge Deller <deller@gmx.de>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	netdev@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Tue, 26 May 2026 at 16:17, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> this series is about improving the handling of pointers in struct
> zorro_device_id's driver_data.
>
> While it's ok on all current Linux platforms to store a pointer in an
> unsigned long variable, it involves casting that loses type information.
> This can be nicely seen in patch #7 where after profiting from patch #6
> the compiler notices a missing const.
>
> Preparing for that change, all zorro_device_ids are converted to use
> named initializers, which is also a nice cleanup that could stand for
> itself, as it improves readability for humans. (That is necessary
> because an anonymous union can be initialized by name, but not using a
> list initializer.)
>
> My motivation for this series is the CHERI hardware extension. With that
> pointers are bigger than longs and thus you cannot store pointers in
> zorro_device_id::driver_data. So this series is also about getting
> support for CHERI into the mainline, but I hope the clean up effects
> mentioned above are justification enough to accept this series.

Thanks for your series!

> The dependencies in this series are as follows:
>
>  - Patch #5 depends on #1, #2

s/5/6/?

>  - Patches #7 and #8 depend on patch #6.
>
> So if the ata maintainers agreed to merge their patch #1 via scsi, and
> Geert agrees to patch #5 and that it's also merged via scsi, patches #1,

s/5/6/?

> #2, #6 and #7 can go in without further coordination.
>
> Patches #3, #4 and #5 are only about using the same initialization style
> for all zorro_device_id and can go in without coordination.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (The Capable Hub) (8):
>   ata: pata_budda: Use named initializer for zorro_device_id
>   scsi: Use named initializer for zorro_device_id
>   net: Use named initializer for zorro_device_id arrays
>   i2c: icy: Use named initializer for zorro_device_id arrays
>   video: fm2fb: Use named initializer for zorro_device_id array
>   zorro: Simplify storing pointers in device id struct
>   scsi: zorro7xx: Make use of struct zorro_device_id::driver_data_ptr
>   video: cirrusfb: Make use of struct zorro_device_id::driver_data_ptr

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
