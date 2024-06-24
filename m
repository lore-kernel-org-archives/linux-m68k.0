Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BDB3FE46
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jun 2024 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719213342; cv=none; b=UyGZav12tmKKemmU1aPzkMkqu/FTWQGK4HUAt5r58w1AdzbT+lzEqXvr38TY26pk7fTJaqlpa2XhRFuPJS6Ahxr7K/F4fJ4G492eQJSaQiQ6xXIfB304Jdiqp8WpkonbzWMyRCYgxMkoYwfy371ztYOLKrhnCzJG3IGmPGRD9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719213342; c=relaxed/simple;
	bh=863bZzI5Hyov3glpWeBbfJP1/dS/pA4ApsW7E7JjIis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXpA0OYI5C7UknR1akQkfB7iYA8vwhT6HrGNeVn9YQpCVrgkhvGvyUoySeadJqjWMhH2IjpyU5mh4hRfGgGAVgoTcGRTRnRtIV95XFRwbn7fvDEfJ+nOiolUPiK4bjZpGC8axXO2Yvrt5JPDLIHMkv2qvyyCR7qTfWekuzSpnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-63bf211542cso32310377b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jun 2024 00:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719213338; x=1719818138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lqB2uTdWab+gyLblegDUqfkSFwnYohEmolmVFa4bz4=;
        b=kCYaMt0ataFVOMKBP1xkZVkKs3T4Pp3D4PdXpY58OOsUinxS3FjO6YGBIvB4uSTwQ+
         ZNepUb8d1Lv8+p+tPdhmt3l3goHgKhfLJzF0sb9A85myMSe8YfujQFdX5QD7r8aJBjYp
         2VCfMyHiF7lyblSolX0PJHlZbduLPpKEqyIEIg4RHZxvUlnIypI6M48JLVaGMLO78rq3
         9UxsdzyAvTxHYcZr0H2eYltYOWIt7gx4ceyjavqpn6+kxUa/dsZc3l6NDOiVo/+nmzJ+
         fljaDukgoMF0gX97pVlDaT7zAs7Q+LFpRg/w/CR5Y9YTr1WpHXjz7V0bwVDm79JR9eTP
         iy2w==
X-Forwarded-Encrypted: i=1; AJvYcCVZCVDGJ/Gifu06wR9EdklsJ49zlUYqC9ytSsNr6cfk+h1eTSBFLs8q/Zg60MJAsjd8h12aIxCwfZCyhcDTn9OHMzRWmJZ4cH1G1zR/a/ub
X-Gm-Message-State: AOJu0YxFhtO33XObfxVtT7lsjVOHkNQy1hDML7PQ1Dy/yev6wz7ig3++
	MWANJBGHpkdUqdIFhS+/fTQS/NkoK69tcIkzs3xIAumXVUihubPikNuS/Nqu
X-Google-Smtp-Source: AGHT+IGXVH7Wnh7bT3HCm+PUErW8T8lGDdRpxKIhXc6fIFe8CMFChoS2zia+2jx7nAkENJQnPNpyPg==
X-Received: by 2002:a81:5bd7:0:b0:62f:9c4a:17bf with SMTP id 00721157ae682-64292ff05d4mr38579397b3.0.1719213338254;
        Mon, 24 Jun 2024 00:15:38 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f14a3cd40sm25317167b3.103.2024.06.24.00.15.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 00:15:38 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dfecd065b0aso3208000276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jun 2024 00:15:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGFhRva03QUh1nhdayyaXReeae8cVyM2AGX7KLJxI4Lia5DTJCLr4tzB2qukWhWqK9Ibx1su8otToHLiwd6Oe5egqkCx20EpW+ZK/ouHEf
X-Received: by 2002:a25:9746:0:b0:dfb:4ae:27c with SMTP id 3f1490d57ef6-e02fc34e4e6mr4348505276.42.1719213337769;
 Mon, 24 Jun 2024 00:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240623232503.9445-1-oak@helsinkinet.fi> <e30354cb-934c-46e1-abc5-1b6c4ae4909a@gmail.com>
In-Reply-To: <e30354cb-934c-46e1-abc5-1b6c4ae4909a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jun 2024 09:15:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7WmKSTnBDqXxLQHkwjp-qBi5ijVNpL5YY4NKXN41owQ@mail.gmail.com>
Message-ID: <CAMuHMdV7WmKSTnBDqXxLQHkwjp-qBi5ijVNpL5YY4NKXN41owQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: fix TT bootup freeze / unexpected (SCU) interrupt messages
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Eero Tamminen <oak@helsinkinet.fi>, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 1:37=E2=80=AFAM Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
>
> On 24/06/24 11:25, Eero Tamminen wrote:
> > Avoid freeze on Atari TT / MegaSTe boot with continues messages of:
> >       unexpected interrupt from 112
> >
> > Which was due to VBL interrupt being enabled in SCU sys mask, but
> > there being no handler for that any more.
> >
> > Fixes: 1fa0b29f3a43f9dd
>
> Fixes: 1fa0b29f3a43f9dd ("fbdev: Kill Atari vblank cursor blinking")
>
> Your Signed-off-by needed as well. And you might want to add:

Indeed

> Link: https://lore.kernel.org/all/9aa793d7-82ed-4fbd-bce5-60810d8a9119@he=
lsinkinet.fi

Please use "Closes:" for links to bug reports.

scripts/checkpatch.pl would have told you (due to the presence of
Reported-by:)

> before the signed-off tag.
>
> With that addressed:
>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks to all!

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
