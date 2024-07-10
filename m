Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39305CB8
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jul 2024 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720597906; cv=none; b=PVgxOza4luUhuttr/4idqOegH/ADA6wir9JpjowmFokTOaPO97EtF1NGvaX2vpdcFPcBA/kNcjxofqSEuHwYjTgPsB63dq80m9yJsjbcFUls07v/BVtfQOJvFFPCUSHolleXEdzgjKfo2aRgvCeg8UBPf6mbqLdCbdz8tNVa6V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720597906; c=relaxed/simple;
	bh=fROySEc7Nwi1oKO0n7ctYzkZdFjrsdxsGKuMuZVUoBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwXftGQUE8FflhX8I54HHyB8EKRvImpUIq5FAOJ3mNa5GsZ3t/m2H5Cd9CggcITmnE5349/+PwuCcKG3Gt1doPeYacAqHAoAnLPSyUz2V1qbzTO1ZkqJVXd7jO5kKu4uLNql56m4RtuV48MoEML5wcj9AS2i+i0rSGAcrqb06uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-64b9f11b92aso54002977b3.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jul 2024 00:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720597903; x=1721202703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xwUkC2957U6M9JtnEiR4qwk1hE+eeGWalXN7vG7quE=;
        b=Bew2Gci3uf3+nkia+v7b3onfvob5ts0PS1NIYP2ilM0ZvBts6h3jk+bhVt/Ux64nU4
         zGweUzVIEAku3a/AzQkl73wRK8GQj19bYdBro/JYTnatHUKp8cXNqsRUlWckbXcblIuX
         zjdXW+segUbaY17FAQ7ULmD+mhedw/04euUGuDxwXTMrkHbQrx5zLihxrhAiFyO9Pw3N
         CcNMM0iksMtfRa9xRYQxc1z8dH3ePvzyrxsXqk0IBVivs6o8tdY56dZTlYhTtOKT0Ji2
         u5/RrSYO13BUk+0Grjd+DgmJ04TOqscTk9KP7WsM/TMuWoaIMIgoGhgNDxhNo69/b9m3
         r5sA==
X-Gm-Message-State: AOJu0YxigaL6tis4kErnVRooDmgD7CRm3p4NltLo4tufq8sEcFAXxxyX
	Cn5LVCLtKt5OQl808nVSks3p1MpJOtthpA5R5xeYuoQiD7Sw1SZ3Oq7YwwSh
X-Google-Smtp-Source: AGHT+IEkLfYePISwCAm8cUXarEnHSl/sDP8NSV6z/5mlL0RZQANyTFgx4d/AT1tDz02qKKS7Q4bkJg==
X-Received: by 2002:a05:690c:b8d:b0:618:8d66:8363 with SMTP id 00721157ae682-658f09d2b39mr65965527b3.41.1720597903121;
        Wed, 10 Jul 2024 00:51:43 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e483ed45sm6515967b3.19.2024.07.10.00.51.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 00:51:42 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e03609bd52dso6059148276.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jul 2024 00:51:42 -0700 (PDT)
X-Received: by 2002:a25:946:0:b0:e03:b319:e022 with SMTP id
 3f1490d57ef6-e041b122232mr5456419276.43.1720597902668; Wed, 10 Jul 2024
 00:51:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710073413.495541-2-gregkh@linuxfoundation.org>
In-Reply-To: <20240710073413.495541-2-gregkh@linuxfoundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jul 2024 09:51:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2Y57bXMHjeGt+-vVQs-12DsoeXNYQ80NL+obbCrQiZw@mail.gmail.com>
Message-ID: <CAMuHMdW2Y57bXMHjeGt+-vVQs-12DsoeXNYQ80NL+obbCrQiZw@mail.gmail.com>
Subject: Re: [PATCH] zorro: make match function take a const pointer
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 9:34=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> In commit d69d80484598 ("driver core: have match() callback in struct bus=
_type
> take a const *"), the match callback for busses was changed to take a con=
st
> pointer to struct device_driver.  Unfortunatly I missed fixing up the zor=
ro

Unfortunately

> code, and was only noticed after-the-fact by the kernel test robot.  Reso=
lve
> this issue by properly changing the zorro_bus_match() function.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: d69d80484598 ("driver core: have match() callback in struct bus_ty=
pe take a const *")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
