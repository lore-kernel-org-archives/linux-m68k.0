Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999661386B2
	for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Apr 2024 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713881340; cv=none; b=H5CZx7e6cy3EnEPDhxq2Tx4A2kbS0QaDsxyVG+FXrW607eYqIBP8qrfMBUoNsiRetNTBHo+I6dIpc7b9eVI74BS3FEa4EEXm7uM21memvVy+Mk1WLGjcLRedc7gNFD20mvT+YhfhvwUPXwBfqnQglUGbDayINiWgcsBpugjDG7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713881340; c=relaxed/simple;
	bh=ks49PqQ/IteSqCP6//03mcgJaCCYpp0on56fIKvWLkQ=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=SXNF+nIyrRK7+BNtmrM0HXjyR0jWZeR+sTmh0FR5NkBoC4P2CXvxawlpJ+NEJBRB2Bj6OoMYq+tTXZs181d/D0v52PLEeQ8iUWEDDHGuGkA2rReRPAztlkxmGkWby1BZbBNY/QNVEFNq1/TdalXGyBU+atRGhGp4mBzXpYABxNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I7jEsI17; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I7jEsI17"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 70973CE10F9;
	Tue, 23 Apr 2024 14:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89611C116B1;
	Tue, 23 Apr 2024 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713881334;
	bh=ks49PqQ/IteSqCP6//03mcgJaCCYpp0on56fIKvWLkQ=;
	h=Subject:To:Cc:From:Date:From;
	b=I7jEsI177YjSnqpOBoMDgMC3rZ8FJOvwpvnlK8AL/XLBtLPNhlI8MbU3E3WKXsp+U
	 F0foyoEESsanWRVDWISCKenHbGS7Mfr4qPKai+JU7dR3O+q0OGC/RkpagjoMmkH3fa
	 AIx+3TAWDRTEA/eig/fd+VhRhIsk0kLq4YsfX3B8=
Subject: Patch "serial/pmac_zilog: Remove flawed mitigation for rx irq flood" has been added to the 6.6-stable tree
To: andy.shevchenko@gmail.com,aneesh.kumar@kernel.org,benh@kernel.crashing.org,christophe.leroy@csgroup.eu,fthain@linux-m68k.org,gregkh@linuxfoundation.org,linux-m68k@lists.linux-m68k.org,mpe@ellerman.id.au,naveen.n.rao@linux.ibm.com,npiggin@gmail.com,stable@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 23 Apr 2024 07:07:40 -0700
Message-ID: <2024042340-iodine-spindle-f6a6@gregkh>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    serial/pmac_zilog: Remove flawed mitigation for rx irq flood

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     serial-pmac_zilog-remove-flawed-mitigation-for-rx-irq-flood.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 1be3226445362bfbf461c92a5bcdb1723f2e4907 Mon Sep 17 00:00:00 2001
From: Finn Thain <fthain@linux-m68k.org>
Date: Mon, 8 Apr 2024 19:23:43 +1000
Subject: serial/pmac_zilog: Remove flawed mitigation for rx irq flood

From: Finn Thain <fthain@linux-m68k.org>

commit 1be3226445362bfbf461c92a5bcdb1723f2e4907 upstream.

The mitigation was intended to stop the irq completely. That may be
better than a hard lock-up but it turns out that you get a crash anyway
if you're using pmac_zilog as a serial console:

ttyPZ0: pmz: rx irq flood !
BUG: spinlock recursion on CPU#0, swapper/0

That's because the pr_err() call in pmz_receive_chars() results in
pmz_console_write() attempting to lock a spinlock already locked in
pmz_interrupt(). With CONFIG_DEBUG_SPINLOCK=y, this produces a fatal
BUG splat. The spinlock in question is the one in struct uart_port.

Even when it's not fatal, the serial port rx function ceases to work.
Also, the iteration limit doesn't play nicely with QEMU, as can be
seen in the bug report linked below.

A web search for other reports of the error message "pmz: rx irq flood"
didn't produce anything. So I don't think this code is needed any more.
Remove it.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: stable@kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Link: https://github.com/vivier/qemu-m68k/issues/44
Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable <stable@kernel.org>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
Link: https://lore.kernel.org/r/e853cf2c762f23101cd2ddec0cc0c2be0e72685f.1712568223.git.fthain@linux-m68k.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/pmac_zilog.c |   14 --------------
 1 file changed, 14 deletions(-)

--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -210,7 +210,6 @@ static bool pmz_receive_chars(struct uar
 {
 	struct tty_port *port;
 	unsigned char ch, r1, drop, flag;
-	int loops = 0;
 
 	/* Sanity check, make sure the old bug is no longer happening */
 	if (uap->port.state == NULL) {
@@ -291,25 +290,12 @@ static bool pmz_receive_chars(struct uar
 		if (r1 & Rx_OVR)
 			tty_insert_flip_char(port, 0, TTY_OVERRUN);
 	next_char:
-		/* We can get stuck in an infinite loop getting char 0 when the
-		 * line is in a wrong HW state, we break that here.
-		 * When that happens, I disable the receive side of the driver.
-		 * Note that what I've been experiencing is a real irq loop where
-		 * I'm getting flooded regardless of the actual port speed.
-		 * Something strange is going on with the HW
-		 */
-		if ((++loops) > 1000)
-			goto flood;
 		ch = read_zsreg(uap, R0);
 		if (!(ch & Rx_CH_AV))
 			break;
 	}
 
 	return true;
- flood:
-	pmz_interrupt_control(uap, 0);
-	pmz_error("pmz: rx irq flood !\n");
-	return true;
 }
 
 static void pmz_status_handle(struct uart_pmac_port *uap)


Patches currently in stable-queue which might be from fthain@linux-m68k.org are

queue-6.6/serial-pmac_zilog-remove-flawed-mitigation-for-rx-irq-flood.patch
