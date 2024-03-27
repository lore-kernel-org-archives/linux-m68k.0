Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3F22D60B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Mar 2024 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711527785; cv=none; b=EyVWzn6AdMTiMB4aR/QaMO4Vq4dyUSIH602g3BZvDxRQ8tj8HnY8lcCBgGSW8kkE8Y76s7O3ajjk7r8lQ8s+ZONlMmEKitvg+d3Uh13jsG2VmDyrGjanmq+D9ObAZIqNV6FJwQ9izTZNeaOplMtljAvC9+DTzwVAosv2uOZugTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711527785; c=relaxed/simple;
	bh=R5NPzgxr5BY6h1b0m90Si7j0l2HNgNAaiLOpl2Gs7uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9rJXtbAExbJ7irrcRe+UWZlE+/mwsWpky0tQfkphs09rpYAa5KgaIk8cM72aHnIg1/zbpEDchLzIMG9OuQ2NWZlpmCBUGIZ/FR3WdOsjc7KmWNIzDy8s/txmd+xOrTkKOnGhvEgasx6zZ34Q8UTDRQYI+jwGUxY85tgFye8thU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc742543119so6197504276.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Mar 2024 01:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527782; x=1712132582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7f2X2rdCkE6DmDq1GCixYncYZShIGa+8VbvYIWaut5g=;
        b=pttZNPDpSdIm/Pm8aAn3mdaV8eQ6i059jisPhSQjPHQ7ZcJ2Jmu6KtWyLVRk53FUTC
         pC920aUuCNntebK5EfWGf52PeFTfkPLIZbKAzRefnj2X8j549GUeofmSOGGRNhSjHkYl
         nWo4ogFWoUSOnbbmwzqz7QtOIyu/y3FvQV44J4A5Gw8rIU19RvTqz2wGzkZEjDxOaGUx
         CmNs+v4//LXbWg1hMU6Vh90w9SG2FZHUzYFprxbhegjJpNuLrJTBa9DqlAUpzraHUYGG
         VplZeF4SqBCoPrS2mebEkmiqUG8Ji95CvA9Vd1sphh+xMvicAx3bB2jNbboNOQ4N2XbO
         fHSg==
X-Forwarded-Encrypted: i=1; AJvYcCXwjgaAvQ8IS4jz3WJ1cgq+6i6iTOlqK88BmJusz1oMQ8+fVfJgPbaFFBczXScHoPLeoOGX72ZAYiEvlLhSQTbsXdo5KY6+dd6umh8C8nT2
X-Gm-Message-State: AOJu0YyfEytwAFYs/Gt8347sYZdetiLyUYsPmxNXYcdZmT1qTwCo3irL
	GjSwoLbnvOFhTT5JS6eIEHCKcV8anFD34bXod/chHafIabO0LYq5XiZExtHtNjw=
X-Google-Smtp-Source: AGHT+IEGZQ9cK+mFaUvSu5z+M3CEfNYTHmLJ79X6SysPfcctitrttmZYhlAmGxv0uZXFmmJxBo4P7g==
X-Received: by 2002:a25:2f55:0:b0:dd1:2dee:ea21 with SMTP id v82-20020a252f55000000b00dd12deeea21mr3180343ybv.8.1711527782239;
        Wed, 27 Mar 2024 01:23:02 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id i9-20020a259d09000000b00dc230f91674sm1763224ybp.26.2024.03.27.01.23.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:23:01 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so5978637276.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Mar 2024 01:23:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzvQWw+ULA2r2tpoHJbvvP8ssgRQkyO6UBdRTgRiGmytmkJgf/gXmLrQANvNFTwkGUd9GYf2whDrgMlTc8kGaWpOHVaReV7xVJBqU/IGmu
X-Received: by 2002:a25:bc87:0:b0:dd1:3cc1:5352 with SMTP id
 e7-20020a25bc87000000b00dd13cc15352mr2883170ybk.15.1711527781412; Wed, 27 Mar
 2024 01:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322014805.30606-1-schmitzmic@gmail.com> <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org>
 <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com> <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com>
 <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org> <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
 <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com> <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org>
 <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com> <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
In-Reply-To: <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Mar 2024 09:22:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+5OPKKdt4aDmWumS=KvttM6bFKmi64ahRWBYXzZCA3g@mail.gmail.com>
Message-ID: <CAMuHMdV+5OPKKdt4aDmWumS=KvttM6bFKmi64ahRWBYXzZCA3g@mail.gmail.com>
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were disabled
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Tue, Mar 26, 2024 at 8:59=E2=80=AFPM Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
> thanks - I'm pretty sure tried that early on but botched it by excessive
> locking (i.e., keeping preemption disabled when calling
> get_zeroed_page()!).
>
> So I don't think you do use too much locking here.
>
> I'm running stress tests for a while now, without any trouble so far.
> Need to add a few other stressors back in, and repeat all that on a
> slower ARAnyM instance but I'm quite confident you found the solution.
>
> Geert: with this data race fixed, it does appear my RFC patch is no
> longer needed. Finn or I probably ought to prepare a new RFC patch to go
> on top of your preemption patch. There is no commit ID to use in a
> Fixes: tag for that one, correct?

As my preemption patch was not applied to any tree yet, I'll just
fold in any fixes.  I think this does deserve Co-developed-by tags,
so please make sure to include your SoB in any fixes.

Thanks!

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
