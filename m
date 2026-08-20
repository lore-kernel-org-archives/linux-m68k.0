Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2A40F733
	for <linux-m68k@vger.kernel.org>; Thu, 20 Aug 2026 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230631; cv=none; b=IZ7xwViZxBU848xrFjVx7FBImr/DDlRhCV249/Di3gg11elQ/or2oGiiLAHdMNxhQntao8ZAUuV47bQ/Hzrf0N6j3e+O8Fdm1V/30QO90+Vgol9ClnR9Z9Fd4VLSexGzM7+Jb71n946Ye+NCcKQxWK3j+PemtSxKSdt386zCmNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230631; c=relaxed/simple;
	bh=sNIyHeXJIudD37ymvCDhwAdu3YYAOP+5oIm4rgTL67A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4zHX/8oi4ZZdgVwb4PnNmntS0NVZwVx6dHLjEYq68OELWtLGObZoJtCha2VFdXtqTGDFVSKLlIQm5vmJHb6iBbWk/aOMDBje+Qam6x3dxjYnrYQ/9pijaxaBVmkNSGb/wBlFqO7EKqBiBqHPGFTwurck3hQC9b12dz3uEW3CPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NM8M7DcD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NM8M7DcD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fd66a094eso817048f8f.3
        for <linux-m68k@vger.kernel.org>; Thu, 20 Aug 2026 05:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787230627; x=1787835427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5FQOdWV8uuYPHZruYYC2UaU3mzYkHKqzVCAV7kcJnP8=;
        b=NM8M7DcD/maAMNt6/cB2xoB+JoB4vhYQFbPp0zhwqnyik8CX6UR01JdNf2te25miZQ
         cdhjE6msdYFu7n97g90SsjqFGd81Q0Xg3Tu8S6HlIO9ZNVuhqzJP5aH5CIsZL059hqWR
         nH2CmsMgdXKU48fqDddNKbwXL54B3JbW3HHJC9BY+iz6iq0KjF88kNyFlJ0kKQRrVYF7
         /iSUsJy/90mANpOfX/3NTyP+7pd25EwqDefFQa0nIToObLukphp5t1xogwAHXChQDy6L
         8AsETEHx7kvL+LeeEcjnMeXIPn2AnQWrhSkjk/htmsRmBknytwp9XtivLnkw1OSC6Z1B
         BV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787230627; x=1787835427;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FQOdWV8uuYPHZruYYC2UaU3mzYkHKqzVCAV7kcJnP8=;
        b=UpnPJ2Ogdv92whz1acdwlKvwruanHveSI1YrFhty9rQtLN03HDRheoPPCo4dJIpF4x
         NG16zMzQp9YauGZHwiCJdPtnGcNWMtowZVQ3h/h2EkHfN7aElaQeXKbVF+PAaCOP79su
         VvaAGvIKbwwO3Hoeune7B+zUX2xin3zOoEBzngxxgQNax7LvE1uDcsl5PfP+OspwNPAM
         vWEw7JiMgsxLK4Fi0XCZaJInDAgGIMQ7KUuY5Wyvs+tDGhd2nYE3q8vKthtxvH9poJ4L
         lnRhgXpgNJzsRG2nYfq98m0PPUCvu+4oiVFa86V4u2ey3VlR8U9NeKMcTUWpVPmXOEZ9
         +zkQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4eeEtAk1zRRvZayeEUXIbgSx84wZWLHYPrhaiS2X5/9kf+zFExWgZLsWUbQrhE5jj+Ymjbzzixzux@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Gse92vUi2tw5SOjqSStOqht/oZlOAt2GPzQpz0TokNyGMCx1
	53zRP+GA/XKIIoTTcgE2ZV1oE3oIpR35/XESy98JyplJQmRM+Q8H5nzXSRAyD24Mvd4=
X-Gm-Gg: AR+sD11q5IwwhVCTT4gEm4Uc5zJLPhaBzvd09m7D8HyGRfDsTal6peHLJ5VmLI+fJAr
	JTcTe/uPNVhfThQPgf5DN0uvh12qogBFr6eXjZ7pAnkI++IX7gxCZ9eR34XpkzwcP8GfTJaK6hA
	WFLl/OONeQ+oSWNqhPLtrDbhje16pVP0yz8XYcW/omfFpdNYqrTYQwUwmeJTAtJPFCsanUSpIxw
	1KSfRsSpHDq1kkzI0rLwE8/JqvhSJLH/VAwFhuJE6QQfZ/8QM2MxkP0+BNb/QulCswm8vEDqZ5j
	XfF6uMHOlIIAi/iD+ASLC0m5Eo3TEPzANi+9CqRxheVOymTyrvhOa3BUW6olzhJMMCFpIWV3bC+
	1MqmYURtQfgWRvNP/W+xKc/BItbMDVmdNl1dsWnX56sAax1zwVBlmjQL+jDPCCr1KIBjHMKqzwn
	YyEMNx8qyoFVT7/h0ZA4Tku9lAGSwDHivWZ7rBj49NQW+tgdFBTCtliMd4i8oYveegaby763ht
X-Received: by 2002:a05:600c:8b27:b0:499:7024:9d4a with SMTP id 5b1f17b1804b1-499aa16a958mr246348125e9.8.1787230626796;
        Thu, 20 Aug 2026 05:57:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aca21c63sm158029965e9.0.2026.08.20.05.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:57:06 -0700 (PDT)
Date: Thu, 20 Aug 2026 14:57:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH] m68k: nfcon: don't call console_is_registered in
 nfcon_device
Message-ID: <aob5oO_7qxII_qTB@pathway.suse.cz>
References: <87ecfzsv6h.fsf@igel.home>
 <CAMuHMdU4C+W6Tpsn3Vr_kqmuU2Vzg7ExXhspmB5qNWMZ3Wnfeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU4C+W6Tpsn3Vr_kqmuU2Vzg7ExXhspmB5qNWMZ3Wnfeg@mail.gmail.com>

On Mon 2026-08-17 11:26:57, Geert Uytterhoeven wrote:
> Hi Andreas,
> 
> CC john, petr, serial
> 
> Thanks for your patch!
> 
> On Sat, 15 Aug 2026 at 09:33, Andreas Schwab <schwab@linux-m68k.org> wrote:
> > Since 7c2af0f634f1 ("tty: tty_io: use console_list_lock for list
> > synchronization") show_cons_active calls the device method under the
> > console_list_lock, but console_is_registered tries to acquire
> > console_list_lock as well, causing a deadlock.  It should not be necessary
> > to check console_is_registered here since the function should not be
> > called in the fist place when the console is not registered.
> 
> Nice catch!

+1

> > Fixes: 7c2af0f634f1 ("tty: tty_io: use console_list_lock for list synchronization")
> > Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue in the m68k tree for v7.3.
> 
> > --- a/arch/m68k/emu/nfcon.c
> > +++ b/arch/m68k/emu/nfcon.c
> > @@ -49,7 +49,7 @@ static void nfcon_write(struct console *con, const char *str,
> >  static struct tty_driver *nfcon_device(struct console *con, int *index)
> >  {
> >         *index = 0;
> > -       return console_is_registered(con) ? nfcon_tty_driver : NULL;
> 
> Interestingly, that call to console_is_registered() was added in
> commit de61a1a3a0830710 ("tty: nfcon: use console_is_registered()"),
> i.e. in the same series that added the extra locking...

Sigh, we clearly did not check the callers of this function properly
at that time :/

> > +       return nfcon_tty_driver;

Honestly, I do not feel comfortable with removing the check
completely.

The commit de61a1a3a083071 ("tty: nfcon: use console_is_registered()"
used console_is_registered() instead of (con->flags & CON_ENABLED).
And CON_ENABLED is historically cleared when the console is suspended,
see console_suspend().

Is is OK to return a valid struct tty_driver for a non-registered
or suspended console for all con->device() callers?

I have found only 4 callers:

  $> git grep "\->device("
  drivers/tty/serial/kgdboc.c:            if (cons->device && cons->device(cons, &idx) == p &&
  drivers/tty/tty_io.c:           struct tty_driver *drv = cs[i]->device(cs[i], &index);
  fs/proc/consoles.c:             driver = con->device(con, &index);
  kernel/printk/printk.c:         driver = c->device(c, index);

These are:

  + configure_kgdboc() in drivers/tty/serial/kgdboc.c
  + show_cons_active() in drivers/tty/tty_io.c
  + show_console_dev() in fs/proc/consoles.c
  + console_device() in kernel/printk/printk.c

, where

  + configure_kgdboc() is used during the system initialization
    when the console should not be suspended

  + show_cons_active() and show_console_dev() are questionable.
    Maybe, we should not advertise the device to the userspace
    when it is suspended.

  + console_device() is used in tty_kopen() -> tty_lookup_driver().
    Also here we likely should not allow to open a suspended device.

Let's take a step back:

We should define the locking context for con->device() callback.
It seems that it is called under console_lock() and
console_srcu_read_lock() in:

  + configure_kgdboc()
  + console_device()

and under console_list_lock() and console_lock() in

  + show_console_dev()
  + show_cons_active()

I would put aside the console_lock(). We are trying to obsolete it.
So it is down to

   console_srcu_read_lock() vs console_list_lock()

Both of them look reasonable. So, I think about adding a variant
of console_is_registered_srcu_read_locked() which would work
with both locking. Something like:

diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
index d41260672e24..d211b6c4da26 100644
--- a/arch/m68k/emu/nfcon.c
+++ b/arch/m68k/emu/nfcon.c
@@ -49,7 +49,7 @@ static void nfcon_write(struct console *con, const char *str,
 static struct tty_driver *nfcon_device(struct console *con, int *index)
 {
 	*index = 0;
-	return console_is_registered(con) ? nfcon_tty_driver : NULL;
+	return console_is_registered_srcu_read_locked(con) ? nfcon_tty_driver : NULL;
 }
 
 static struct console nf_console = {
diff --git a/include/linux/console.h b/include/linux/console.h
index d624200cfc17..b90527db4eca 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -311,7 +311,7 @@ struct nbcon_write_context {
  * @name:		The name of the console driver
  * @write:		Legacy write callback to output messages (Optional)
  * @read:		Read callback for console input (Optional)
- * @device:		The underlying TTY device driver (Optional)
+ * @device:		The underlying TTY device driver (Optional) [1]
  * @unblank:		Callback to unblank the console (Optional)
  * @setup:		Callback for initializing the console (Optional)
  * @exit:		Callback for teardown of the console (Optional)
@@ -334,6 +334,9 @@ struct nbcon_write_context {
  * @kthread:		Printer kthread for this console
  * @rcuwait:		RCU-safe wait object for @kthread waking
  * @irq_work:		Defer @kthread waking to IRQ work context
+ *
+ * [1] The @device callback must be called under either console_list_lock()
+ *     or console_srcu_read_lock().
  */
 struct console {
 	char			name[16];
@@ -473,8 +476,13 @@ struct console {
 };
 
 #ifdef CONFIG_LOCKDEP
+extern bool console_list_lock_is_held(void);
 extern void lockdep_assert_console_list_lock_held(void);
 #else
+static inline bool console_list_lock_is_held(void)
+{
+	return 1;
+}
 static inline void lockdep_assert_console_list_lock_held(void)
 {
 }
@@ -555,6 +563,16 @@ static inline bool console_is_registered_locked(const struct console *con)
 	return !hlist_unhashed(&con->node);
 }
 
+/*
+ * Variant of console_is_registered() when either the console_srcu_read_lock
+ * or console_list_lock is held.
+*/
+static inline bool console_is_registered_srcu_read_locked(const struct console *con)
+{
+	lockdep_assert(console_srcu_read_lock_is_held() || console_list_lock_is_held());
+	return !hlist_unhashed(&con->node);
+}
+
 /*
  * console_is_registered - Check if the console is registered
  * @con:	struct console pointer of console to check
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823..9b632b91f096 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -109,6 +109,12 @@ static struct lockdep_map console_lock_dep_map = {
 	.name = "console_lock"
 };
 
+bool console_list_lock_is_held(void)
+{
+	return lockdep_is_held(&console_mutex);
+}
+EXPORT_SYMBOL(console_list_lock_is_held);
+
 void lockdep_assert_console_list_lock_held(void)
 {
 	lockdep_assert_held(&console_mutex);


Alternative solution would be to require the srcu locking.
IMHO, it should be perfectly fine to use the srcu_read_lock in
both show_console_dev() and show_cons_active().

What do you think, please?
John?

Best Regards,
Petr
