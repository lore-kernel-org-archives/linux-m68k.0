Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FCF269806
	for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jul 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868107; cv=none; b=W+mLfwT1hAYy4Wbz9bGDSnOcPrGHhAG3avJLSyytXls7Bv98uOicPGxZszQ6goV4zYwCLc3iEooG8xpDRMctZ2O0CD6wp5n37DUxY/Hhw4bt0Faor8nsGTBKnsEhaPrUCBLXDImSd9ryqrYIYtz45/zDnxy2LPDFZPVf9PntD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868107; c=relaxed/simple;
	bh=Ul0O4QgDlk8UCNwdkXN6z/QOIq9BOSolmblqo5VTi3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NO21v4iLUS44tfUdNJF3fhPRlyjxwm1UrOTQo6na8KEjjwmpf85iIPk/yfki9ASqYxOD+VoCEELjLR3XrxX7kdrE5UwpuicE5AA8lD5YiS3H3ckrqf4AM77V36bEbrCrVpz6vxeCrJun2CD4QEgRdYOIlgBJbzeMiqA9EynlUvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e7fc3309f2so1903643137.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jul 2025 02:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753868102; x=1754472902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bw9ch+r6opJEUpIjpC/Dh8bkHfaHF/wvasrBSsHdMc=;
        b=S0P/eQ7SdeaqaPxCJrTYxV1dnTj7Psosso8lNNWWasIlghsvU4dnVqPYIhFvCiF5DY
         VN5QHseSs8aZh/HvPOEOnkNaMMeEMC7MulP5ZtIz8rOX/D7nB7GWveeOoDyo0X58JB5w
         HaS4V9heu/7tCsatUIMFgCSg7rccmkJLFwV2lDMDDm1cMY6i9mUGqbRZ+QxYK5jvm9bS
         zDyDdAbEaSCcJO8SInx+4VfSWHSoGPxf7vUaQUyfeOAMrfZBvc5KDEMRhi1OqWT7NSAi
         f8zzUpRSzI9VxUgNQm/e44jUFYjrjRfQEATXzMzL2ClKl2nHF0Hdl/3HZMqYug4sShq3
         UnzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCMxbCKBC5hwhCY8pc4sONdUwl0ZWSQV32l+/nwBGAgUet8yboGmZVBCwRBuE6WiLNtWGbAgn4Rh0Y@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz766S0O1UUyzSfgrZ4jrglM7w+yyOc7QUXcoHteFfGCd71/ua7
	NGNxFxfbuOV2uLEArhEP5BOBgvSz+UBbdsnBBKOxiPsdWaBi9eXMoqk2KhF54wa3
X-Gm-Gg: ASbGncvx4VU4Z9d6ikdPs/ev+dQif1cnIIG0v67UmgwqJ7UAZWyBoSFZGXFPBOR9R8q
	0I4bNjLk+flgKOYXPe2cY6B1dwot4Txn+cu2ZX6x/CIuc2Rra05/TnUqYzB4nJ72OtkzraLhI24
	JqNmiosNNrnD6xUID7kg14HdU2bXVKUoIbJAcqfoBiQKvNUCT0jk+vq1U4qCw0ZaFJMQ/wCuJnb
	bHTFqBX/fvqlyO+HV9eGBQdX3zTvQNT+5PJm8xvItcMAc1PlgDmJryGZU5yt3YfOXjVhiWswq9p
	yrySwqhAY4/oxjp4p0Or61xv5noyZ5GznSOwi7uf6pYqqd0u7+DUDIJ9l5yet5q1qrtTGt1D3ee
	68Se4zYoKvWcqxydx3LFhxCok2H/hl/Wd5wgIBNi0ltybrriJ/juqNwAD9b9A
X-Google-Smtp-Source: AGHT+IERIFGri3cDgWaxqK2uT9CAgT/3n9sn94LssC7R0jGHxhEfCibx2rG8zfRkuqf01yjlBG3APA==
X-Received: by 2002:a05:6102:15a9:b0:4e5:9d76:e8c8 with SMTP id ada2fe7eead31-4fbe87a2aa6mr1469822137.18.1753868101974;
        Wed, 30 Jul 2025 02:35:01 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa46e0938esm1919005137.12.2025.07.30.02.35.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 02:35:01 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e2b5ffb932so2125772137.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jul 2025 02:35:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjuKB+n0YbYQZkbLrFltlfM/7J8LEnAGMSVDKz5oVfl1+6DipTwv0o+6/G0aP4ZoDHeAPFAZFI+qCd@lists.linux-m68k.org
X-Received: by 2002:a05:6102:1627:b0:4fa:58e:89c9 with SMTP id
 ada2fe7eead31-4fbe7f1e5f8mr1723113137.5.1753868100701; Wed, 30 Jul 2025
 02:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702114924.091581796@infradead.org> <20250702121158.465086194@infradead.org>
In-Reply-To: <20250702121158.465086194@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 11:34:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn4z1pioTtBGMfQM0jsLviqS2jwysaWXpoLxWYoGa82w@mail.gmail.com>
X-Gm-Features: Ac12FXwKLsTXDgyNFgB_fGOTKvy3Pfg_IiJiWZaeBuDhTzV4576DeZdUaxz8VC0
Message-ID: <CAMuHMdXn4z1pioTtBGMfQM0jsLviqS2jwysaWXpoLxWYoGa82w@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] sched/deadline: Less agressive dl_server handling
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, clm@meta.com, 
	linux-kernel@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Wed, 2 Jul 2025 at 14:19, Peter Zijlstra <peterz@infradead.org> wrote:
> Chris reported that commit 5f6bd380c7bd ("sched/rt: Remove default
> bandwidth control") caused a significant dip in his favourite
> benchmark of the day. Simply disabling dl_server cured things.
>
> His workload hammers the 0->1, 1->0 transitions, and the
> dl_server_{start,stop}() overhead kills it -- fairly obviously a bad
> idea in hind sight and all that.
>
> Change things around to only disable the dl_server when there has not
> been a fair task around for a whole period. Since the default period
> is 1 second, this ensures the benchmark never trips this, overhead
> gone.
>
> Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> Reported-by: Chris Mason <clm@meta.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lkml.kernel.org/r/20250520101727.507378961@infradead.org

Thanks for your patch, which is now commit cccb45d7c4295bbf
("sched/deadline: Less agressive dl_server handling") upstream.

This commit causes

    sched: DL replenish lagged too much

to be printed after full user-space (Debian) start-up on m68k
(atari_defconfig running on ARAnyM).  Reverting this commit and fixing
the small conflict gets rid of the message.

> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -701,6 +701,7 @@ struct sched_dl_entity {
>         unsigned int                    dl_defer          : 1;
>         unsigned int                    dl_defer_armed    : 1;
>         unsigned int                    dl_defer_running  : 1;
> +       unsigned int                    dl_server_idle    : 1;
>
>         /*
>          * Bandwidth enforcement timer. Each -deadline task has its
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1215,6 +1215,8 @@ static void __push_dl_task(struct rq *rq
>  /* a defer timer will not be reset if the runtime consumed was < dl_server_min_res */
>  static const u64 dl_server_min_res = 1 * NSEC_PER_MSEC;
>
> +static bool dl_server_stopped(struct sched_dl_entity *dl_se);
> +
>  static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_dl_entity *dl_se)
>  {
>         struct rq *rq = rq_of_dl_se(dl_se);
> @@ -1234,6 +1236,7 @@ static enum hrtimer_restart dl_server_ti
>
>                 if (!dl_se->server_has_tasks(dl_se)) {
>                         replenish_dl_entity(dl_se);
> +                       dl_server_stopped(dl_se);
>                         return HRTIMER_NORESTART;
>                 }
>
> @@ -1639,8 +1642,10 @@ void dl_server_update_idle_time(struct r
>  void dl_server_update(struct sched_dl_entity *dl_se, s64 delta_exec)
>  {
>         /* 0 runtime = fair server disabled */
> -       if (dl_se->dl_runtime)
> +       if (dl_se->dl_runtime) {
> +               dl_se->dl_server_idle = 0;
>                 update_curr_dl_se(dl_se->rq, dl_se, delta_exec);
> +       }
>  }
>
>  void dl_server_start(struct sched_dl_entity *dl_se)
> @@ -1663,7 +1668,7 @@ void dl_server_start(struct sched_dl_ent
>                 setup_new_dl_entity(dl_se);
>         }
>
> -       if (!dl_se->dl_runtime)
> +       if (!dl_se->dl_runtime || dl_se->dl_server_active)
>                 return;
>
>         dl_se->dl_server_active = 1;
> @@ -1684,6 +1689,20 @@ void dl_server_stop(struct sched_dl_enti
>         dl_se->dl_server_active = 0;
>  }
>
> +static bool dl_server_stopped(struct sched_dl_entity *dl_se)
> +{
> +       if (!dl_se->dl_server_active)
> +               return false;
> +
> +       if (dl_se->dl_server_idle) {
> +               dl_server_stop(dl_se);
> +               return true;
> +       }
> +
> +       dl_se->dl_server_idle = 1;
> +       return false;
> +}
> +
>  void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
>                     dl_server_has_tasks_f has_tasks,
>                     dl_server_pick_f pick_task)
> @@ -2435,7 +2454,7 @@ static struct task_struct *__pick_task_d
>         if (dl_server(dl_se)) {
>                 p = dl_se->server_pick_task(dl_se);
>                 if (!p) {
> -                       if (dl_server_active(dl_se)) {
> +                       if (!dl_server_stopped(dl_se)) {
>                                 dl_se->dl_yielded = 1;
>                                 update_curr_dl_se(rq, dl_se, 0);
>                         }
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5879,7 +5879,6 @@ static bool throttle_cfs_rq(struct cfs_r
>         struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
>         struct sched_entity *se;
>         long queued_delta, runnable_delta, idle_delta, dequeue = 1;
> -       long rq_h_nr_queued = rq->cfs.h_nr_queued;
>
>         raw_spin_lock(&cfs_b->lock);
>         /* This will start the period timer if necessary */
> @@ -5963,10 +5962,6 @@ static bool throttle_cfs_rq(struct cfs_r
>
>         /* At this point se is NULL and we are at root level*/
>         sub_nr_running(rq, queued_delta);
> -
> -       /* Stop the fair server if throttling resulted in no runnable tasks */
> -       if (rq_h_nr_queued && !rq->cfs.h_nr_queued)
> -               dl_server_stop(&rq->fair_server);
>  done:
>         /*
>          * Note: distribution will already see us throttled via the
> @@ -7060,7 +7055,6 @@ static void set_next_buddy(struct sched_
>  static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
>  {
>         bool was_sched_idle = sched_idle_rq(rq);
> -       int rq_h_nr_queued = rq->cfs.h_nr_queued;
>         bool task_sleep = flags & DEQUEUE_SLEEP;
>         bool task_delayed = flags & DEQUEUE_DELAYED;
>         struct task_struct *p = NULL;
> @@ -7144,9 +7138,6 @@ static int dequeue_entities(struct rq *r
>
>         sub_nr_running(rq, h_nr_queued);
>
> -       if (rq_h_nr_queued && !rq->cfs.h_nr_queued)
> -               dl_server_stop(&rq->fair_server);
> -
>         /* balance early to pull high priority tasks */
>         if (unlikely(!was_sched_idle && sched_idle_rq(rq)))
>                 rq->next_balance = jiffies;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
