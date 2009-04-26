From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Atari SCSI - ST-DMA locking and error handling fixes
Date: Sun, 26 Apr 2009 09:24:48 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904260909510.32441__11079.9728231088$1240801541$gmane$org@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
 <1239696787.2049.8.camel@petr>
 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
 <1239698381.2049.25.camel@petr>
 <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
 <1239774966.20245.4.camel@petr>
 <alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
 <1239862075.12777.14.camel@petr>
 <alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
 <1239868903.12777.25.camel@petr>
 <alpine.DEB.1.00.0904170314220.18855@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0904190308310.8939@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0904260751590.30061@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <alpine.DEB.1.00.0904260751590.30061@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Hi Geert,

some fixes to the Atari NCR5380 SCSI driver: if the ST-DMA lock cannot be taken 
in the queue function, indicate host busy to the block layer. Fix return codes 
of abort and reset functions, and add scsi_unregister to module exit. 
Error handling is still messed up, most likely due to missing ST-DMA lock in 
abort and reset. This is still WIP, but might benefit users with a Falcon less 
prone to SCSI lockups, i.e. more stable SCSI clock signal.

Signed-off-by: Michael Schmitz <schmitz@debian.org>

  Michael

---
 drivers/scsi/atari_NCR5380.c |   78 +++++++++++++++++++++++++++--------------
 drivers/scsi/atari_scsi.c    |   47 +++++++++++++++++++++----
 2 files changed, 91 insertions(+), 34 deletions(-)

diff --git a/drivers/scsi/atari_NCR5380.c b/drivers/scsi/atari_NCR5380.c
index 0471f88..3ba46d5 100644
--- a/drivers/scsi/atari_NCR5380.c
+++ b/drivers/scsi/atari_NCR5380.c
@@ -966,13 +966,6 @@ static int NCR5380_queue_command(Scsi_Cmnd *cmd, void (*done)(Scsi_Cmnd *))
 
 	cmd->result = 0;
 
-	/*
-	 * Insert the cmd into the issue queue. Note that REQUEST SENSE
-	 * commands are added to the head of the queue since any command will
-	 * clear the contingent allegiance condition that exists and the
-	 * sense data is only guaranteed to be valid while the condition exists.
-	 */
-
 	local_irq_save(flags);
 	/* ++guenther: now that the issue queue is being set up, we can lock ST-DMA.
 	 * Otherwise a running NCR5380_main may steal the lock.
@@ -987,10 +980,32 @@ static int NCR5380_queue_command(Scsi_Cmnd *cmd, void (*done)(Scsi_Cmnd *))
 	 * alter queues and touch the lock.
 	 */
 	if (!IS_A_TT()) {
+		int rv;
+		/* MSch: since we may now get called from softirq context here, 
+		 * we cannot always sleep while waiting for the lock.
+		 * Use status from falcon_get_lock() to detect if the lock was
+		 * successfully taken, and return appropriate status to midlevel
+		 * otherwise.
+		 * We used to pause the midlevel SCSI timer here; races between 
+		 * command timeout and lowlevel error handling should not hurt
+		 * because the command isn't in any of the queues yet.
+		 */
 		/* perhaps stop command timer here */
-		falcon_get_lock();
+		rv = falcon_get_lock();
 		/* perhaps restart command timer here */
+		if (rv) {
+			local_irq_restore(flags);
+			return SCSI_MLQUEUE_HOST_BUSY;
+		}
 	}
+
+	/*
+	 * Insert the cmd into the issue queue. Note that REQUEST SENSE
+	 * commands are added to the head of the queue since any command will
+	 * clear the contingent allegiance condition that exists and the
+	 * sense data is only guaranteed to be valid while the condition exists.
+	 */
+
 	if (!(hostdata->issue_queue) || (cmd->cmnd[0] == REQUEST_SENSE)) {
 		LIST(cmd, hostdata->issue_queue);
 		SET_NEXT(cmd, hostdata->issue_queue);
@@ -1014,10 +1029,12 @@ static int NCR5380_queue_command(Scsi_Cmnd *cmd, void (*done)(Scsi_Cmnd *))
 	 * If we're not in an interrupt, we can call NCR5380_main()
 	 * unconditionally, because it cannot be already running.
 	 */
-	if (in_interrupt() || ((flags >> 8) & 7) >= 6)
+	/* As of 2.6.19, the coroutine has to be put on the task queue instead
+	 * of being called directly. It might still be called directly if not 
+	 * in softirq, though. Need to test this.  
+	 */
 		queue_main();
-	else
-		NCR5380_main(NULL);
+
 	return 0;
 }
 
@@ -1463,6 +1480,7 @@ static int NCR5380_select(struct Scsi_Host *instance, Scsi_Cmnd *cmd, int tag)
 	ARB_PRINTK("scsi%d: arbitration complete\n", HOSTNO);
 
 	if (hostdata->connected) {
+		
 		NCR5380_write(MODE_REG, MR_BASE);
 		return -1;
 	}
@@ -2065,7 +2083,6 @@ static void NCR5380_information_transfer(struct Scsi_Host *instance)
 				/*
 				 * The preferred transfer method is going to be
 				 * PSEUDO-DMA for systems that are strictly PIO,
-				 * since we can let the hardware do the handshaking.
 				 *
 				 * For this to work, we need to know the transfersize
 				 * ahead of time, since the pseudo-DMA code will sit
@@ -2631,7 +2648,7 @@ static void NCR5380_reselect(struct Scsi_Host *instance)
  *	host byte of the result field to, if zero DID_ABORTED is
  *	used.
  *
- * Returns : 0 - success, -1 on failure.
+ * Returns : SUCCESS - success, FAILED on failure.
  *
  * XXX - there is no way to abort the command that is currently
  *	 connected, you have to wait for it to complete.  If this is
@@ -2701,11 +2718,12 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
 			local_irq_restore(flags);
 			cmd->scsi_done(cmd);
 			falcon_release_lock_if_possible(hostdata);
-			return SCSI_ABORT_SUCCESS;
+			return SUCCESS;
 		} else {
-/*			local_irq_restore(flags); */
+			/* not sure */
+			local_irq_restore(flags);
 			printk("scsi%d: abort of connected command failed!\n", HOSTNO);
-			return SCSI_ABORT_ERROR;
+			return FAILED;
 		}
 	}
 #endif
@@ -2729,7 +2747,7 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
 			 * yet... */
 			tmp->scsi_done(tmp);
 			falcon_release_lock_if_possible(hostdata);
-			return SCSI_ABORT_SUCCESS;
+			return SUCCESS;
 		}
 	}
 
@@ -2747,7 +2765,7 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
 	if (hostdata->connected) {
 		local_irq_restore(flags);
 		ABRT_PRINTK("scsi%d: abort failed, command connected.\n", HOSTNO);
-		return SCSI_ABORT_SNOOZE;
+		return FAILED;
 	}
 
 	/*
@@ -2782,7 +2800,7 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
 			ABRT_PRINTK("scsi%d: aborting disconnected command.\n", HOSTNO);
 
 			if (NCR5380_select(instance, cmd, (int)cmd->tag))
-				return SCSI_ABORT_BUSY;
+				return FAILED;
 
 			ABRT_PRINTK("scsi%d: nexus reestablished.\n", HOSTNO);
 
@@ -2809,7 +2827,7 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
 					local_irq_restore(flags);
 					tmp->scsi_done(tmp);
 					falcon_release_lock_if_possible(hostdata);
-					return SCSI_ABORT_SUCCESS;
+					return SUCCESS;
 				}
 			}
 		}
@@ -2835,7 +2853,9 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
 	 */
 	falcon_release_lock_if_possible(hostdata);
 
-	return SCSI_ABORT_NOT_RUNNING;
+	/* NCR5380 has FAILED here */
+	/* return SUCCESS; */
+	return FAILED;
 }
 
 
@@ -2844,16 +2864,18 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
  *
  * Purpose : reset the SCSI bus.
  *
- * Returns : SCSI_RESET_WAKEUP
+ * Returns : SUCCESS
  *
  */
 
+#undef	FALCON_RESET_KILL_QUEUES
+
 static int NCR5380_bus_reset(Scsi_Cmnd *cmd)
 {
 	SETUP_HOSTDATA(cmd->device->host);
 	int i;
 	unsigned long flags;
-#if 1
+#if defined(FALCON_RESET_KILL_QUEUES)
 	Scsi_Cmnd *connected, *disconnected_queue;
 #endif
 
@@ -2878,7 +2900,8 @@ static int NCR5380_bus_reset(Scsi_Cmnd *cmd)
 	 * through anymore ... */
 	(void)NCR5380_read(RESET_PARITY_INTERRUPT_REG);
 
-#if 1	/* XXX Should now be done by midlevel code, but it's broken XXX */
+#if defined(FALCON_RESET_KILL_QUEUES)	
+	/* XXX Should now be done by midlevel code, but it's broken XXX */
 	/* XXX see below                                            XXX */
 
 	/* MSch: old-style reset: actually abort all command processing here */
@@ -2934,7 +2957,7 @@ static int NCR5380_bus_reset(Scsi_Cmnd *cmd)
 	 * the midlevel code that the reset was SUCCESSFUL, and there is no
 	 * need to 'wake up' the commands by a request_sense
 	 */
-	return SCSI_RESET_SUCCESS | SCSI_RESET_BUS_RESET;
+	return SUCCESS;
 #else /* 1 */
 
 	/* MSch: new-style reset handling: let the mid-level do what it can */
@@ -2982,6 +3005,7 @@ static int NCR5380_bus_reset(Scsi_Cmnd *cmd)
 	local_irq_restore(flags);
 
 	/* we did no complete reset of all commands, so a wakeup is required */
-	return SCSI_RESET_WAKEUP | SCSI_RESET_BUS_RESET;
-#endif /* 1 */
+	/* The new error handler code implicitly does this for us anyway */
+	return SUCCESS;
+#endif /* defined(FALCON_RESET_KILL_QUEUES) */
 }
diff --git a/drivers/scsi/atari_scsi.c b/drivers/scsi/atari_scsi.c
index ad7a23a..9ebfbc6 100644
--- a/drivers/scsi/atari_scsi.c
+++ b/drivers/scsi/atari_scsi.c
@@ -196,7 +196,7 @@ static unsigned long atari_dma_xfer_len(unsigned long wanted_len,
 static irqreturn_t scsi_tt_intr(int irq, void *dummy);
 static irqreturn_t scsi_falcon_intr(int irq, void *dummy);
 static void falcon_release_lock_if_possible(struct NCR5380_hostdata *hostdata);
-static void falcon_get_lock(void);
+static int falcon_get_lock(void);
 #ifdef CONFIG_ATARI_SCSI_RESET_BOOT
 static void atari_scsi_reset_boot(void);
 #endif
@@ -498,6 +498,16 @@ static int falcon_dont_release = 0;
  * again (but others waiting longer more probably will win).
  */
 
+/*
+ * MSch 20061228: in 2.6.x, the fairness wait appears to open a race with
+ * concurrent use of the lock by the IDE driver. Once the lock is taken by
+ * IDE, the SCSI queuecmd function can no longer schedule because it is run
+ * from softirq context a lot. 
+ * Disable the fairness wait until I have had time to sort out the lock issues.
+ */
+#undef FALCON_FAIRNESS_WAIT
+#define FALCON_NEVER_SLEEP 1
+
 static void falcon_release_lock_if_possible(struct NCR5380_hostdata *hostdata)
 {
 	unsigned long flags;
@@ -519,7 +529,9 @@ static void falcon_release_lock_if_possible(struct NCR5380_hostdata *hostdata)
 		}
 		falcon_got_lock = 0;
 		stdma_release();
+#if defined(FALCON_FAIRNESS_WAIT)
 		wake_up(&falcon_fairness_wait);
+#endif
 	}
 
 	local_irq_restore(flags);
@@ -540,21 +552,37 @@ static void falcon_release_lock_if_possible(struct NCR5380_hostdata *hostdata)
  * Complicated, complicated.... Sigh...
  */
 
-static void falcon_get_lock(void)
+/* MSch 20061229: in order to avoid sleeping when the lock is not available, 
+ * return the current lock state here. atari_queue_command() will then return
+ * with error, causing the midlevel code to pause request submission.
+ */
+static int falcon_get_lock(void)
 {
 	unsigned long flags;
 
 	if (IS_A_TT())
-		return;
+		return 0;
 
 	local_irq_save(flags);
 
-	while (!in_irq() && falcon_got_lock && stdma_others_waiting())
+#if defined(FALCON_FAIRNESS_WAIT)
+	/* MSch: we may not sleep even while in softirq ! */
+	while (!in_interrupt() && falcon_got_lock && stdma_others_waiting())
 		sleep_on(&falcon_fairness_wait);
-
+#endif
 	while (!falcon_got_lock) {
 		if (in_irq())
 			panic("Falcon SCSI hasn't ST-DMA lock in interrupt");
+		/* we may not sleep in soft interrupts neither, so bail out */
+#if defined(FALCON_NEVER_SLEEP)
+		if (stdma_islocked()) {
+#else
+		if (in_softirq() && stdma_islocked()) {
+#endif
+			// printk(KERN_INFO "Falcon SCSI does not hold ST-DMA lock in softirq!\n" );
+			local_irq_restore(flags);
+			return 1;
+		}
 		if (!falcon_trying_lock) {
 			falcon_trying_lock = 1;
 			stdma_lock(scsi_falcon_intr, NULL);
@@ -569,6 +597,8 @@ static void falcon_get_lock(void)
 	local_irq_restore(flags);
 	if (!falcon_got_lock)
 		panic("Falcon SCSI: someone stole the lock :-(\n");
+
+	return 0;
 }
 
 
@@ -589,7 +619,7 @@ int atari_queue_command(Scsi_Cmnd *cmd, void (*done)(Scsi_Cmnd *))
 #endif
 
 
-int __init atari_scsi_detect(struct scsi_host_template *host)
+int atari_scsi_detect(struct scsi_host_template *host)
 {
 	static int called = 0;
 	struct Scsi_Host *instance;
@@ -652,6 +682,8 @@ int __init atari_scsi_detect(struct scsi_host_template *host)
 		}
 		atari_dma_phys_buffer = virt_to_phys(atari_dma_buffer);
 		atari_dma_orig_addr = 0;
+		printk(KERN_ERR "atari_scsi_detect: ST-RAM "
+			"double buffer at %p\n", atari_dma_phys_buffer);
 	}
 #endif
 	instance = scsi_register(host, sizeof(struct NCR5380_hostdata));
@@ -745,6 +777,7 @@ int atari_scsi_release(struct Scsi_Host *sh)
 {
 	if (IS_A_TT())
 		free_irq(IRQ_TT_MFP_SCSI, sh);
+	scsi_unregister(atari_scsi_host);
 	if (atari_dma_buffer)
 		atari_stram_free(atari_dma_buffer);
 	return 1;
@@ -828,7 +861,7 @@ int atari_scsi_bus_reset(Scsi_Cmnd *cmd)
 	} else {
 		atari_turnon_irq(IRQ_MFP_FSCSI);
 	}
-	if ((rv & SCSI_RESET_ACTION) == SCSI_RESET_SUCCESS)
+	if (rv == SUCCESS)
 		falcon_release_lock_if_possible(hostdata);
 
 	return rv;
-- 
1.5.6.5

