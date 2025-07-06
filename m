Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39576203706
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797679; cv=none; b=R309DIZW0MxLo+FqZKx82wqlve9xrzBmLgARj6bSrg0jyLBNxvj/PpIh4ttRcP8fP71QylmY8HpXmvv+DX5MnQDlYopgu6snLF7OdIr3ob1BW3w5syTLneJb9bmkp9iw/iwwuvbm+s7/klpchPuggLXUT3FzkE2EijWHINXK370=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797679; c=relaxed/simple;
	bh=9K+ZlIV9VyTnpA8DmHWdooGPTnN2QzCix4/ezMftv38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLw7T1HOklWs/wmeOnNKWPxRuiQYCvosozirn62i7dGnHqykIitHtTf8D6PPJ2ANw+SV+ytNoACRvekENLtKmC87Vzvkj7LbGvLeVaujiwgF3tevK7YG7V1TmJ2iosxhmPJx9rs6rqttZDeJEhu1OpsvU0mQZP8Tg/kNjqYq1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5331f409ed2so617843e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751797676; x=1752402476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5qeoi1n24XfufXve0BXfIa0gWLLUTNel49/JF9R7Qk=;
        b=CPrOJmAjBveGoUWFw/F3RrB36J1Z7fsMCG8jN2ARSgU0hNCp4uykxcWAQSVa4s0+VK
         PDd9YBY7qRMWoDcq7vleTH5y7yvIJG8sPIWcD8RQ4N6cHxgWotvyZ31iZAUbBtEwft8+
         leNfIYOZjdr/U+vgJx6rNAMNxfmKz0szvTqas4kSaUyRpJaSYU646nGTchRCEqDmQkyX
         jvP9Ps2Da1Su9Nk4SyeZS7ukWvUWgk9/DdcgY6vcVoWvz7h8dnG0K3kExHhp6dM2Sub3
         Go/k0lVgCmSBox3NCD1jAyG8+3jOKuZ5+oAHD8b1fU2o3LdvlnW+xmJZhbH1kHsqhRDo
         903A==
X-Gm-Message-State: AOJu0Yzuu0itfmJver0XRKuBlXLQhtFC+D8hujscDQkk/EOUBE+9ywVI
	3kraWTl3oDKGEulCaCVkIn4MM8LqabX+7uNjwK+tUBjYEKvqresQH68ei23AuDDU
X-Gm-Gg: ASbGncso18c+sFt5wQq4/v2d+K7T46KzCQdbwCHt6PUWWFqChq/55GD0FlZFdYeOCq3
	z9scIzRH26hy64QlpexjDGFM601+dXd7RDGFqq6thiPsr0Rx2TSy0xO+Zozohn0nMLB+An5siOX
	ZoAT6xqIbN0rXjojPq5szFTnd2xAXLswLCOgyxPmTB/jdnG7Zi3m1ymDdLFJkpTYSOCdNX0wjwa
	29YqbKXUAphhdOjzYm655S+xXkgjs+3A9Ba6E0mCHauCmd8I0g+pvupUKiSOuoIQzK2d+jcEeOc
	9JHUZgD1bU178/bWEBzThguUdrZ2BgY8N4RpFi5+p1T4fTljypF19QM0MICwyC1q306AkCR/QBS
	JzLxSWWSZtPE+qUblu3TY+c3xtvZgb+UfJIMpQuI=
X-Google-Smtp-Source: AGHT+IFc9x7J2zS3O2QeI3aRmy1gg+1z/RBsMLFTsfjckjcC4HYczqDGvuMRbR1V9GdsJXnsiXWUlw==
X-Received: by 2002:a05:6122:318e:b0:531:45f1:604d with SMTP id 71dfb90a1353d-534f66481c9mr2176304e0c.6.1751797676385;
        Sun, 06 Jul 2025 03:27:56 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5347906c2fdsm884995e0c.30.2025.07.06.03.27.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 03:27:56 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-530d764149eso566029e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:27:56 -0700 (PDT)
X-Received: by 2002:a05:6122:2522:b0:531:4041:c4c7 with SMTP id
 71dfb90a1353d-534f6647ef7mr2383299e0c.7.1751797675864; Sun, 06 Jul 2025
 03:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743115195.git.fthain@linux-m68k.org> <ec2d443d3c3213028bbbab7c2e0382cd53db75fe.1743115195.git.fthain@linux-m68k.org>
In-Reply-To: <ec2d443d3c3213028bbbab7c2e0382cd53db75fe.1743115195.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 12:27:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqZ8AVgx7i21PWQcv6MCCfv8nN+g3c5VieAAr_vB6qSw@mail.gmail.com>
X-Gm-Features: Ac12FXyDnW8Qrbd8AeQfhiv1PJDIJ_HfDyd7HbCagdBx1CNeK_YtloNRAxfCHtE
Message-ID: <CAMuHMdXqZ8AVgx7i21PWQcv6MCCfv8nN+g3c5VieAAr_vB6qSw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] m68k: Remove unused "cursor home" code from debug console
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 23:44, Finn Thain <fthain@linux-m68k.org> wrote:
> The cursor home operation is unused and seems undesirable for logging.
> Remove it. The console_not_cr label actually means "not line feed and
> not carriage return either" so take the opportunity to replace it with
> something less confusing. Rectify some inconsistent whitespace while
> we're here.
>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
