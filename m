Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C56155300
	for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Nov 2024 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732120990; cv=none; b=N/t6GoxMTNRvsIOLZozzqeicFh+BK0BxMN84JWpXM1xVbGJ22Kr3DPXBax5WmMHuYj9t+8meDYb4skEndjXmtvKYM0V0+8VAv+65gya35bsh7/Wp0+xp87zv2mun8gkrzV3z1E/RCYC/ATRQDBVHi2L0muK2L3u3zkMnfMRqBp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732120990; c=relaxed/simple;
	bh=VoKLmbRrI7wCnPyJA/0lO81/9Rgx94RGC1msUcc1qss=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hQig19X3KuDEnCuLPZGiALsPd23rcpz9HEwH3DJ5qfogeBGSsV9ahkQzQqjx/uQEzVd0rBtaKWZhZeJfqre2I/r6OsJ9jWENsvfuR7i3UtmYKJnFZCJbr1AHjLyZH2vrv/SQHKjDqNgZGLT/VQNwbddvwes2OLzlRS9RS2Zbgc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D58C5C53CE;
	Wed, 20 Nov 2024 16:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF736C4CECD;
	Wed, 20 Nov 2024 16:43:05 +0000 (UTC)
Date: Wed, 20 Nov 2024 11:43:41 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Tomas Glozar
 <tglozar@redhat.com>
Subject: Re: [PATCH RFC 0/2] Add basic tracing support for m68k
Message-ID: <20241120114341.30ac73c6@gandalf.local.home>
In-Reply-To: <2dc1cdfa-d33a-48b6-ab77-d04b06a3efe8@yoseli.org>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
	<3a8f6faa-62c6-4d32-b544-3fb7c00730d7@yoseli.org>
	<20241115102554.29232d34@gandalf.local.home>
	<cbb67ee2-8b37-4a4d-b542-f89ddae90e94@yoseli.org>
	<20241115145502.631c9a2c@gandalf.local.home>
	<2c43288a-517d-4220-ad31-f84dda8c1805@yoseli.org>
	<20241118152057.13042840@gandalf.local.home>
	<22856ed6-b9d0-4206-b88d-4226534c8675@yoseli.org>
	<20241119102631.76363f2a@gandalf.local.home>
	<20241119112850.219834f5@gandalf.local.home>
	<e4456cb1-b1bc-453b-b3b5-3ee4f03995be@yoseli.org>
	<20241119131035.3c42a533@gandalf.local.home>
	<66e2b7cd-4a4f-4f60-9846-a14c476bd050@yoseli.org>
	<20241120103150.3442d658@gandalf.local.home>
	<2dc1cdfa-d33a-48b6-ab77-d04b06a3efe8@yoseli.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 Nov 2024 16:59:55 +0100
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:

> > And that way you will see what 'ptr' is before the crash. Or did you do
> > that already?  
> 
> Yes, I did, sorry I thought it was in the previous dump :-(.

Can you see if this makes a difference?

Patch libtracefs:

diff --git a/src/tracefs-events.c b/src/tracefs-events.c
index 77d1ba89b038..19ea3b3f8d36 100644
--- a/src/tracefs-events.c
+++ b/src/tracefs-events.c
@@ -274,7 +274,7 @@ static int open_cpu_files(struct tracefs_instance *instance, cpu_set_t *cpus,
 		if (snapshot)
 			tcpu = tracefs_cpu_snapshot_open(instance, cpu, true);
 		else
-			tcpu = tracefs_cpu_open_mapped(instance, cpu, true);
+			tcpu = tracefs_cpu_open(instance, cpu, true);
 		if (!tcpu)
 			goto error;
 

-- Steve
