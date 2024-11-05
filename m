Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04B41D86C4
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815581; cv=none; b=ASBSpYWcCTWsZ+hbqQffMVnFOITsH4GQ6jKMV29p4cVbNMJvE9JgdIg34w9W/O70S1A33Mkl473nq/5t58C5CEjr5G/9J43FHy0gLKQf5rb0H2FQnjU5VwRhSbOU/3VFIN94f+SD44PbuCNOhG6VWRXQslXSGk8a43QT3qSR+Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815581; c=relaxed/simple;
	bh=ooqBMyn7IkY1EMB5+dADT7XFmLv2wwYQcv6WMw6VLUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dI4M4O+Jv+har5c/vWWQcnLybSZQUzkKNT3flj4X/gpQYyN1soCNMWjvCytOyzS0V521aY04Vn79U9VALJTq5ZG7JgltNtocDP0GcEzL60FNnYL+2fXzjtsmyJx2lY6YOBuh+eo9ZF6nMRhrinRMuXy7DEaPQFYeCZGfXycA98c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e2e2baf1087so5108770276.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 06:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730815578; x=1731420378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dByBoeMx7u2t6CItkpw3sdIy9gmLIh3WMRbQfsLLyP4=;
        b=fPrC20+q4KjiWnPbMJsp+Gov1PLtojYXxWMko9zK5XBhicEdvVDtrtr0iFELNQCFue
         5JnOI+6KfFhs/OkpGp7siYQWeYASv96TXPyu441FLGPr8tBfGCn3gobhVS5KJyjoga03
         cRKD7L4RBmuKhJ0CSYk80VO3OqgwPlVyf5EH9dd5KcoDlJ1yZ0QTghdpR+s/uZSjkTnS
         /lt1DOJB9ShfpQGLvEOhi+g4uZ7/rb6BNpwb7mFeYkYm6W0/Hyo16VxNnnzuNbmQ0hEX
         Ziiew+9RggNMh9204n0o4QR/Bbskb7r/swN92EJbNP+13TkA91WNN+Sd3CCBUdl0WWN1
         euIQ==
X-Gm-Message-State: AOJu0YzVFu0lBalF4JJLkF/9WJHg5NQUKgnP/9Q8JgEjP3MzBKFiypBl
	2uve0quRuKjpWBFQ2W8Q9OVHTbkTswMhMssj0ISZC9h/rZxsme+D9cDdrwXz
X-Google-Smtp-Source: AGHT+IGr6CnvAxkybgpt9lpnouti68AkzMShxTTHhv61uhWPaNZ98VlNXrJ1Xai2CP6EiYglXhd7CQ==
X-Received: by 2002:a05:6902:18cc:b0:e30:c442:3e4f with SMTP id 3f1490d57ef6-e330254b02amr13577979276.12.1730815576814;
        Tue, 05 Nov 2024 06:06:16 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e30e8a9a269sm2403842276.37.2024.11.05.06.06.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 06:06:16 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e38fc62b9fso47062527b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 06:06:16 -0800 (PST)
X-Received: by 2002:a05:690c:9c0e:b0:6e3:2ec1:457a with SMTP id
 00721157ae682-6ea64bb23e7mr163000147b3.29.1730815576068; Tue, 05 Nov 2024
 06:06:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241020205758.332095-1-thorsten.blum@linux.dev>
In-Reply-To: <20241020205758.332095-1-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 15:06:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWF_y0dnOBzO5AazXVow0yJs4agFShW=Bk24jsGZgou9A@mail.gmail.com>
Message-ID: <CAMuHMdWF_y0dnOBzO5AazXVow0yJs4agFShW=Bk24jsGZgou9A@mail.gmail.com>
Subject: Re: [PATCH] m68k: kernel: Use str_read_write() helper function
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2024 at 10:58=E2=80=AFPM Thorsten Blum <thorsten.blum@linux=
.dev> wrote:
> Remove hard-coded strings by using the str_read_write() helper function
> and remove some unnecessary negations.
>
> Compile-tested only.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.13.

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
