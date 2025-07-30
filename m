Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840CE293C4A
	for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jul 2025 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868794; cv=none; b=aWUbKRmo/lrYVy58nCDhDoxdglgrc+cikv7/dTST9sA5otmYx3jR/868nMAPs5aCrTWlB9Zihq6Q3r61LaNexjO8TZ5k1PDSJ55RdmgAU1yREYFODaMPpfWW5CRmiHE04Mu7VuaSrJWVx+IcUDwEE/PK5zkrz3B7lZzLuSrw/+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868794; c=relaxed/simple;
	bh=AUDj59rYnczPCMf9wlp6ZingVWh2KbRausWbvPoRJ1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=trkNo77KzMXBeRff6l0LYxLJi/2386QG7wEykP96Z1APJVWPTH8a65CRrSXrEKxuQmARnHbXtGc9aSuDtMvaO7+5grNOxNTzjplea3gs3EvADShPxjsdZu7ToQ5xYYYp6dHbaQRsUBxGxrWuiUzi3+zQaIkvNkyB+cX/BZDoe9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzL5KCjx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzL5KCjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753868791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w8YLhjpZYCS4lKUs2U55ivx7YPJBp2KB/Xof2yC5kTA=;
	b=fzL5KCjx+RNSgSGOkZuWX7KV9ji/TtcmuqZCQmkAbfDJaBXzPaZ02Q2rLNhksGMs33ya3H
	Aya7uf1fR3IY/QGvVsEVVJDc7F2biGOlvtU6g5xg61U6KLpWrTzneIOeizOFfIrEtIMYd2
	X9dgPjZAydqj7ivSS2WJslW3Hj30uM4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-KnPzRKADP_SlZ6yHVVI3Og-1; Wed, 30 Jul 2025 05:46:29 -0400
X-MC-Unique: KnPzRKADP_SlZ6yHVVI3Og-1
X-Mimecast-MFC-AGG-ID: KnPzRKADP_SlZ6yHVVI3Og_1753868788
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b785d52c19so1886787f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jul 2025 02:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753868788; x=1754473588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8YLhjpZYCS4lKUs2U55ivx7YPJBp2KB/Xof2yC5kTA=;
        b=IXl8nAzSUdXosT/T3F+J7Twc2GxnD0fsPmhH5DR7tPMbIOa3zTQWZqFl0A/rpJlq0/
         xuY6zSZ7+ne+dFP/hRSxqM+pPqFo6y9CHvLDzGkApWHNYIrK6hCfrV7UwcZ0Bx2njV5M
         UYQe/3jW9T/GDkfbcEBEHgowcq9AYaVv8cVdEJvHdkRB8J6XXUdsYHSQKaYnWsv4aCYz
         RlCRKz+Hn2toHwfMRKXGBb3CU2B5HodlI/2rEUnuoVbLrzbz03jxE3NTS+XDbqdExW0V
         eyjdJsvt8FgAUNd8KA2n2t6tNYIQDYrvsbkB0EqB0CGApowFeWbkFXgvPHhJT/B3k7uz
         /W3w==
X-Forwarded-Encrypted: i=1; AJvYcCVkIvQZ6Zec8fN88ic20KH4QPQlFIMf3uK7r0cICvEsROl1W0texwczMP/qxr/z7JlvaJyG3eS86dD9@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw+RLa2hT8pOm1jG/8Tc97apRgrSGMuNXVkcKZEV3TTUzC9YEze
	9/Kv6STl+xrcyOEJTm5s27lHRUEuDBBbBW/PvrqyaYWdBU7LZ+c0OAgc5NBMVneO+uTmyMTpFOT
	UYXgE2hZvfxOjFwDhSbJV38BXv0vyPgP5UEA6zPBOUu5cFyWwKlVTVvVCmczq8GHfkZTWng==
X-Gm-Gg: ASbGncuqySJbTg+Do420osuhC2SyKlG/Q6gJrIhPnmOJbTQubUuIcEkXMRXgALKkAXJ
	qcTylGURWB9WjckqOYzpec5iWvjhF0HF8f3neytLYVIGGng6AZ29vZYsDz6cUUDLsfDW9ld0S5W
	wpZOqTLKCl/d0cdw+PoukBIhtRR/54P63gyZ9AN3JAedA6xedxkl9yEfyyh70LTlX29PyMUXFgF
	KCGZUhzs0d6nzI2IceoQ11A/mfgkLyj/EdAZTRqZCmVEssUIAInHolVXvsxNM80mAMHbXThM0WR
	pW6v6irWgM1KZYjzGqTTUIpEYnIt0At/R/o5381ulkNyqVLIclzOYdAN0dVE5timIQrr5A==
X-Received: by 2002:a05:6000:41d3:b0:3b7:974d:5359 with SMTP id ffacd0b85a97d-3b7974d597dmr873877f8f.32.1753868788365;
        Wed, 30 Jul 2025 02:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKkBPIcxvn3I2VLjanO8enRfr0E8zNPS46Uf7PRzUN7RGEKOsEdB7MUQb6QgWZ0jBstua6bA==
X-Received: by 2002:a05:6000:41d3:b0:3b7:974d:5359 with SMTP id ffacd0b85a97d-3b7974d597dmr873853f8f.32.1753868787970;
        Wed, 30 Jul 2025 02:46:27 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.43.90.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b785258135sm11317502f8f.42.2025.07.30.02.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:46:27 -0700 (PDT)
Date: Wed, 30 Jul 2025 11:46:23 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org,
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH v2 02/12] sched/deadline: Less agressive dl_server
 handling
Message-ID: <aInp78zC_WwVW6yd@jlelli-thinkpadt14gen4.remote.csb>
References: <20250702114924.091581796@infradead.org>
 <20250702121158.465086194@infradead.org>
 <CAMuHMdXn4z1pioTtBGMfQM0jsLviqS2jwysaWXpoLxWYoGa82w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXn4z1pioTtBGMfQM0jsLviqS2jwysaWXpoLxWYoGa82w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RLDJqz06fXNhLe9c5YsnTSC2rBKmIjhzdwPU18NeqKU_1753868788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 30/07/25 11:34, Geert Uytterhoeven wrote:
> Hi Peter,

Apologies for interjecting.

> On Wed, 2 Jul 2025 at 14:19, Peter Zijlstra <peterz@infradead.org> wrote:
> > Chris reported that commit 5f6bd380c7bd ("sched/rt: Remove default
> > bandwidth control") caused a significant dip in his favourite
> > benchmark of the day. Simply disabling dl_server cured things.
> >
> > His workload hammers the 0->1, 1->0 transitions, and the
> > dl_server_{start,stop}() overhead kills it -- fairly obviously a bad
> > idea in hind sight and all that.
> >
> > Change things around to only disable the dl_server when there has not
> > been a fair task around for a whole period. Since the default period
> > is 1 second, this ensures the benchmark never trips this, overhead
> > gone.
> >
> > Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> > Reported-by: Chris Mason <clm@meta.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Link: https://lkml.kernel.org/r/20250520101727.507378961@infradead.org
> 
> Thanks for your patch, which is now commit cccb45d7c4295bbf
> ("sched/deadline: Less agressive dl_server handling") upstream.
> 
> This commit causes
> 
>     sched: DL replenish lagged too much
> 
> to be printed after full user-space (Debian) start-up on m68k
> (atari_defconfig running on ARAnyM).  Reverting this commit and fixing
> the small conflict gets rid of the message.

Does
https://lore.kernel.org/lkml/20250615131129.954975-1-kuyo.chang@mediatek.com/
help already (w/o the revert)?

Best,
Juri

