Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EFA2DA75A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518670; cv=none; b=fW3GYLP/5DuNnYn49z/PfbUthvD3ITcHh0BDtoSSSeylrn9AraPUNH7DBMq3jSBcJjbasbVldUyV+dz8pdpRCOkttO32J2XUtF1M0sHotZ4XfmEfZWypbYs3vt1wqEe0EOpAaw9Rw9cwYjWtt2P9IvAHyMnEaj9LVgrsmeyb4ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518670; c=relaxed/simple;
	bh=8VkAPD9LDqm7d05XF+l4kP18KbZK75aLsQU4vJdd6zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJybm/jdnCdTirMk9n9+m5NMoeDLqbnBgKbDJSYJgHKgSj1REP+x4A9FI+2/LRbcsixSiOenalMjeILz5zbKMCQ/FfTXdAIty5Vfb3/eqc2Ucc6kodPWqAYxeZkER4EWyTSckXHq5cs4fdQuz1DOwqIOqyQuPeHqweS8/Z5JNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5ccb36d5a57so1098755e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 07:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518668; x=1791123468;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hSwyiSqecYc1b+uiw5Lwtr2HGwahE5D4OZtCe4oNRG4=;
        b=mrPIJeyjZquvDmEVsAiStze+9ULeO63WaS9KDc5ibqul9SmDSfXI6WyI+HvNF4wLcl
         BviLuVJI1cK/yssyVAvR80Fn4WuyLqV8r5nCyL46oE0jQManLuYsiOJhC5MpXhrdU2RQ
         WemeQcFt82AoORHVRcSfEcBL+T/DW6U7CI6sbEmvTMYYlKbN6U6w3HmeO1WS7jQ6ZPLG
         KzTzH91kjwjlziAFbKo+dqHetyATYWEmTYVaLEf7U/9YFwdwF8bHLK8AxsctTSnUiEDv
         cpJmsMm5GlAleK+sX+gh6QTiCM0uoPYN6PylWZORP8/BJRkmBeOfWgk9pLYMoFhzng4o
         ma/w==
X-Gm-Message-State: AFq9FYJWkOloTbqKMiEqX4ifPMKsK6oOwCGzhLDIrlg2teaQX+SU9ktR
	Byi52jLqEtnzPOdl8DWxlBH++aX8bGoHOjPk6Ivd7NZyaIVsmknWXnqp6o3fQuqL
X-Gm-Gg: AYBFou2hAxjjr1ojnDibU60BxnH43Wno7xGg/P45it5Y0TSIobia+ClC4LykGfJO6hp
	jU5k9CVlaG2z2yH9T+OrOp9ME4j6R9IDAlGIQkDGoWn70TTh3ddxW2UrNsMYVB3TZBpprsqN9Oh
	CVgBMqJTGIO1pYhbLl4f1jqG7/7UewuUebL+jw/xpznPRm93ean+AP+XbdbYtNZc1+I65e1ixtK
	C9m/GxOpsJjS7EvU3HdDJpWQLtw0JvNnfUUVfiM59Xyi+ap/AsItrWmfjB6UuKEUWXto6KDnixv
	fKrj1DwqERsFDzdheiZlDwYVKFDo7Svqpen7drTY9tMNFcieeM8aTv5I0fd8xSXgLUq2Ykv3Mpo
	bU0GVzX91E8vPGDO9v8VGHuCZlVRu4nvG0zNqCyGS7YHIVyprJFoErT2wLjPBue0/OtgnexNW+Q
	5MwlMgl9DyxOOSPePaK21coojhUUqZO+Sbzzxi360OoQSlutr4cjHKmNgh/l505yUy7/X8ZBgOC
	2o3k+dYkPrPqTllI+iIPDBu/zyyEyPaKqd+
X-Received: by 2002:a05:6122:35ce:b0:5cd:53ad:8e8e with SMTP id 71dfb90a1353d-5cd53ad90f8mr1905915e0c.16.1790518667630;
        Sun, 27 Sep 2026 07:17:47 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde4f96c9fsm5478982e0c.6.2026.09.27.07.17.46
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 07:17:46 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9b0bdf5b5so782718e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 07:17:46 -0700 (PDT)
X-Received: by 2002:a05:6102:1627:b0:7a6:f970:27d6 with SMTP id
 ada2fe7eead31-7af1e9f2d0cmr3199511137.20.1790518666358; Sun, 27 Sep 2026
 07:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731094402.741645-3-thorsten.blum@linux.dev> <CAMuHMdXfst6urDAoSKQgbjB0j0vU7c0v=WM-gOe93iBEb0Li=w@mail.gmail.com>
In-Reply-To: <CAMuHMdXfst6urDAoSKQgbjB0j0vU7c0v=WM-gOe93iBEb0Li=w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 16:17:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtDAzX5OsWHteKk7uyaFvXG1o9xvnsDkeH68HR47m9tQ@mail.gmail.com>
X-Gm-Features: AclHuK8L3KT4Gm-Oc3iO6o7xAeDJJ21XQiCKW5qIvopKolo9VS5m0M8TAzfubE8
Message-ID: <CAMuHMdWtDAzX5OsWHteKk7uyaFvXG1o9xvnsDkeH68HR47m9tQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] m68k/serial: Use generic BASE_BAUD in asm/serial.h
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 14:26, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 31 Jul 2026 at 11:44, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> > Include asm-generic/serial.h and use the generic BASE_BAUD definition
> > instead of redefining it.
> >
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Sorry, wrong copy-'n-paste:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
