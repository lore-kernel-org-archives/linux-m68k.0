Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CA524BC
	for <linux-m68k@lists.linux-m68k.org>; Wed, 17 Apr 2024 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713337162; cv=none; b=TQTsKlo9OCjhyGr03ptX7D851WW7mmHyiA1dw7xq9ntNZnQTalu0vxjm7eE66gT2/K9anmFc5c838DpWN4rCiUz3KMoEVG8ZQLxrIzkJqRBkBiVv3mH2UhRB9oo5Bz+nbzscVzM2zYtTm258AA0Lq3tS7T3ktMGUGzuNfWDPmXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713337162; c=relaxed/simple;
	bh=bV/6rZhNiu6DTOPQiYgUK/Ajgl51VAIwJiSFdeSpC+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyWRk+6urnc35JGEC/uMbH0oIMexprsOKVJUA63FAOetXg+SiVGi33/rE9iA4PtHXN20B1vM/jE2G5QNUCcdhEqFzLdQwUBEuFIr0Vo1B1D8NOyABWK1lfphaWlFAiSTVFN3zk1qLQz6QMn9ug4W5SePZwIzWppeemCd0rDi/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61ad5f2c231so34922357b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Apr 2024 23:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713337158; x=1713941958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNBTFylNp1r18zI4oWOtCV2YLW7OIa4vsXfZKOlHcl0=;
        b=AF/8KbYwZaO4xWhfl9SKttgSySiCKGVXQ+oSIUUdiXDyoujwNoEF5w7QUCj9hRNBI5
         NFByDMRAj66S/iPIrCENP1USRw0Nyv8+QMnPh9XdhX3iSbgv9BH5LwsX0nYGWzBYRL1g
         8EIR4quDZfGh9zHPq9yAUvQPYXlkgQpRJpda6QfcodDvRyk0pK7oQd+aJWQ0xVPflrOX
         TPrWsSC48hFBLvRNaYGBVnnfu5TTZCT7b1/Tj3P2OkEzlB7zvgzpDUbA56E/k7qGNww5
         zQ0aQ75kNm4SRvlcJAV5nC2hIgcajVraCqMBodxDvumh9h9RlBJHsWLsMpwzZgtdT81F
         pI0A==
X-Forwarded-Encrypted: i=1; AJvYcCX6nE7g914kMeYJcdczx9XC/RlzSZYe89BopDpI9yCOteoXdqwFU8KrlvVIW9eWZRLhxa9y7Du+Xa7M62sgFDXTgJfpv+xOq6UBs57MwV0s
X-Gm-Message-State: AOJu0Ywts7/Z4S1SarJP0OF/JDYtQasEFu0pESMJYleVlaIZ0LQUaJAJ
	VzwV57TOMUQFKmrYfUknfe6BIK0aLomZBaQhJ0gA8Zu+o66hMk2mQj5Bqdc7
X-Google-Smtp-Source: AGHT+IGOh5ffzWVY+7cxg4UTKKiDxMF/Z6sbQgR/1oHfJTbM9g7UDW1XXwI5XRNR/n8y6RJ6xK1LhA==
X-Received: by 2002:a81:4987:0:b0:61a:c316:9952 with SMTP id w129-20020a814987000000b0061ac3169952mr8018753ywa.44.1713337158279;
        Tue, 16 Apr 2024 23:59:18 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id d65-20020a814f44000000b0061ab4627d7esm1684902ywb.102.2024.04.16.23.59.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 23:59:18 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso4594589276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Apr 2024 23:59:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYPmqjsVtaVR/qNqFd8ZBtNh8LQ87bKcDjAIB/nRUdVVjN5EOg/6xqPnreu7eimkKeQVSUre36+Z6+e+cCjWwEHyilyq5wuDJC4PYmwmrq
X-Received: by 2002:a25:3155:0:b0:dcd:1f17:aaea with SMTP id
 x82-20020a253155000000b00dcd1f17aaeamr5795064ybx.26.1713337157926; Tue, 16
 Apr 2024 23:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416203643.3390-1-schmitzmic@gmail.com>
In-Reply-To: <20240416203643.3390-1-schmitzmic@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Apr 2024 08:59:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-ggmMVera8Ya4fDLCJzDXguKCOpg2i_+g98ZvAoctHA@mail.gmail.com>
Message-ID: <CAMuHMdV-ggmMVera8Ya4fDLCJzDXguKCOpg2i_+g98ZvAoctHA@mail.gmail.com>
Subject: Re: [PATCH RFC] m68k: Handle __generic_copy_to_user faults more carefully
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Tue, Apr 16, 2024 at 10:36=E2=80=AFPM Michael Schmitz <schmitzmic@gmail.=
com> wrote:
> I have tested this fault scenario with a transfer beginning
> at a single byte at the end of a mapped page only, which IMO
> does violate m68k alignment rules. I cannot remember ever
> seeing such faults reported from conforming software before.

68020+ does support unaligned data accesses, so IMHO such transfers
are valid.  For compatibility with 68000/68008/68010/68012, data is
recommended to be 2-byte aligned.
Instructions must always be aligned to 2 bytes, though.

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
